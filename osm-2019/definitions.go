package osm_2019

import (
	"database/sql"
	"errors"
	"flag"
	"fmt"
	_ "github.com/lib/pq"
	"github.com/peter-mount/golib/kernel"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"os"
	"sort"
	"strings"
)

type TableDefinitions struct {
	tables              map[string]*TableDefinition
	db                  *sql.DB
	file                *string
	srid                *int
	listTablesFlag      *bool
	importTableFlag     *string
	schema              *string
	prefix              *string
	importCategoryFlag  *string
	importAllTablesFlag *bool
	inspectTableFlag    *string
	useDBFlag           *bool
	useTxFlag           *bool
}

// A table definition in the yaml file
type TableDefinition struct {
	Name        string   `yaml:"name"`
	Category    string   `yaml:"category"`
	Description string   `yaml:"description"`
	Type        string   `yaml:"type"`
	Columns     []string `yaml:"columns"`
	Where       string   `yaml:"where"`
	sqlTable    SqlTable
}

func (t *TableDefinitions) Name() string {
	return "TableDefinitions"
}

func (t *TableDefinitions) Init(k *kernel.Kernel) error {
	// The yaml file to use
	t.file = flag.String("f", "table-definitions.yaml", "Name of table definitions yaml to use")

	// The configuration of the output - schema is only required if the action is not listTables
	t.prefix = flag.String("prefix", "planet_osm", "The prefix used in osm2pgsql")
	t.schema = flag.String("schema", "", "The schema to hold the extracted tables")
	t.srid = flag.Int("srid", 3857, "Srid to use if not 3857")

	// actions, these are mutually exclusive
	t.listTablesFlag = flag.Bool("l", false, "List available tables")
	t.importCategoryFlag = flag.String("c", "", "Import an entire category")
	t.importTableFlag = flag.String("t", "", "Import a single table")
	t.importAllTablesFlag = flag.Bool("a", false, "Import everything")
	t.inspectTableFlag = flag.String("inspect", "", "Inspect table in DB")

	t.useDBFlag = flag.Bool("i", false, "Import directly into postgis")
	t.useTxFlag = flag.Bool("tx", false, "Wrap with transaction")

	return nil
}

// ensureOnlyOneTrue returns true only if just 1 entry in the array is true
func ensureOnlyOneTrue(b ...bool) bool {
	// Find first true entry
	for li, lv := range b {
		if lv {
			// Check importAllTablesFlag remaining bool's are false by failing on first true
			for _, rv := range b[li+1:] {
				if rv {
					return false
				}
			}
			// pass as just lv is true
			return true
		}
	}
	// All bool's were false or none supplied
	return false
}

func (t *TableDefinitions) PostInit() error {

	// Ensure only one action is enabled
	if !ensureOnlyOneTrue(
		*t.importAllTablesFlag,
		*t.importCategoryFlag != "",
		*t.listTablesFlag,
		*t.importTableFlag != "",
		*t.inspectTableFlag != "",
	) {
		return errors.New("Requires only one of -a, -c, -l or -t. Try -h for a list of options")
	}

	// Ensure db actions have the db enabled
	// currently only inspect as it performs queries
	if ensureOnlyOneTrue(*t.inspectTableFlag != "") && !*t.useDBFlag {
		return errors.New("Requested function requires -i to use the DB")
	}

	// in case someone tries a blank prefix overriding the default
	if *t.prefix == "" {
		return errors.New("-prefix must not be \"\"")
	}

	// schema is required except for when listing tables
	if *t.schema == "" && !*t.listTablesFlag {
		return errors.New("-schema must be provided")
	}

	in, err := ioutil.ReadFile(*t.file)
	if err != nil {
		return err
	}

	err = yaml.Unmarshal(in, &t.tables)
	if err != nil {
		return err
	}

	// Ensure table has a name & compile them
	for k, v := range t.tables {
		// Ensure table has a name, this can be overridden in the yaml
		if v.Name == "" {
			v.Name = k
		}

		// Generate the SQL Table data
		err = v.generateSqlTable(*t.srid)
		if err != nil {
			return err
		}
	}

	return nil
}

func (t *TableDefinitions) Start() error {
	if *t.useDBFlag {
		uri := os.Getenv("POSTGRESDB")
		if uri == "" {
			return errors.New("No DB URI configured in POSTGRESDB environment variable")
		}

		db, err := sql.Open("postgres", uri)
		if err != nil {
			return err
		}
		t.db = db

		t.db.SetMaxIdleConns(1)
		t.db.SetMaxOpenConns(1)
	}

	return nil
}

func (t *TableDefinitions) Stop() {
	if t.db != nil {
		_ = t.db.Close()
		t.db = nil
	}
}

func (t *TableDefinitions) Run() error {
	var err error

	if *t.listTablesFlag {
		t.listTables()
	} else if *t.importTableFlag != "" {
		err = t.importTable()
	} else if *t.importAllTablesFlag {
		err = t.importAllTables()
	} else if *t.importCategoryFlag != "" {
		err = t.importCategory()
	} else if *t.inspectTableFlag != "" {
		err = t.inspectTable()
	} else {
		return errors.New("Requested task is currently unsupported")
	}

	return err
}

// getCategories returns a sorted slice of importCategoryFlag names and a map of tables per importCategoryFlag
func (t *TableDefinitions) getCategories() ([]string, map[string][]string) {
	cats := make(map[string][]string)
	for k, v := range t.tables {
		cats[v.Category] = append(cats[v.Category], k)
	}

	var cat []string
	for k, v := range cats {
		cat = append(cat, k)
		sort.SliceStable(v, func(i, j int) bool {
			return v[i] < v[j]
		})
	}
	sort.SliceStable(cat, func(i, j int) bool {
		return cat[i] < cat[j]
	})

	return cat, cats
}

func (t *TableDefinitions) listTables() {
	fmt.Println("List of available tables")

	// Get a list of categories and tables
	cat, cats := t.getCategories()
	for _, c := range cat {
		fmt.Printf("\nCategory: %s\n", c)
		for _, n := range cats[c] {

			table := t.tables[n]
			// Desc is the first line only, the appended "" is to ensure we have an entry in the slice for blanks
			desc := append(splitText([]string{}, "", table.Description, 60), "")
			fmt.Printf("    %-16s %s\n", n, desc[0])
		}
	}

	os.Exit(0)
}

func (t *TableDefinitions) importTable() error {

	table, exists := t.tables[*t.importTableFlag]
	if !exists {
		return fmt.Errorf("Unknown table %s", *t.importTableFlag)
	}

	sql, err := t.wrapTX(func(sql []string) ([]string, error) {
		return table.sql(sql, *t.prefix, *t.schema), nil
	})
	if err != nil {
		return err
	}

	return t.importSql(sql)
}

func (t *TableDefinitions) importAllTables() error {

	sql, err := t.wrapTX(func(sql []string) ([]string, error) {
		cat, cats := t.getCategories()
		for _, catName := range cat {
			for _, tableName := range cats[catName] {
				table := t.tables[tableName]
				sql = table.sql(sql, *t.prefix, *t.schema)
			}
		}
		return sql, nil
	})
	if err != nil {
		return err
	}

	return t.importSql(sql)
}

func (t *TableDefinitions) importCategory() error {

	_, cats := t.getCategories()
	tables, exists := cats[*t.importCategoryFlag]
	if !exists {
		return fmt.Errorf("Unknown category %s", *t.importCategoryFlag)
	}

	sql, err := t.wrapTX(func(sql []string) ([]string, error) {
		for _, tableName := range tables {
			table := t.tables[tableName]
			sql = table.sql(sql, *t.prefix, *t.schema)
		}

		return sql, nil
	})
	if err != nil {
		return err
	}

	return t.importSql(sql)
}

func (t *TableDefinitions) wrapTX(f func([]string) ([]string, error)) ([]string, error) {
	var sql []string

	if *t.useTxFlag {
		sql = append(sql, "BEGIN")
	}

	sql, err := f(sql)
	if err != nil {
		return nil, err
	}

	if *t.useTxFlag {
		sql = append(sql, "COMMIT")
	}

	return sql, nil
}

func (t *TableDefinitions) importSql(sql []string) error {
	if t.db == nil {
		printSql(sql)
		return nil
	} else {
		return t.runSql(sql)
	}
}

func printSql(sql []string) {
	for _, s := range sql {
		if strings.HasPrefix(s, "-- ") {
			fmt.Println(s)
		} else {
			fmt.Println(s + ";\n")
		}
	}
}

func (t *TableDefinitions) runSql(sql []string) error {
	for _, s := range sql {
		if strings.HasPrefix(s, "-- ") {
			fmt.Println(s)
		} else {
			fmt.Println(s + ";\n")

			_, err := t.db.Exec(s)
			if err != nil {
				return err
			}
		}
	}
	return nil
}
