package osm_2019

import (
	"errors"
	"flag"
	"fmt"
	"github.com/peter-mount/golib/kernel"
	"gopkg.in/yaml.v3"
	"io/ioutil"
	"os"
	"sort"
	"strings"
)

type TableDefinitions struct {
	tables     map[string]*TableDefinition
	file       *string
	listTables *bool
	showTable  *string
}

type TableDefinition struct {
	Name        string   `yaml:"name"`
	Category    string   `yaml:"category"`
	Description string   `yaml:"description"`
	Type        string   `yaml:"type"`
	Columns     []string `yaml:"columns"`
	Where       string   `yaml:"where"`
	SqlTable    SqlTable
}

type ColumnDef struct {
	Field      string
	Type       string
	Expression string
}

func (t *TableDefinitions) Name() string {
	return "TableDefinitions"
}

func (t *TableDefinitions) Init(k *kernel.Kernel) error {
	t.file = flag.String("f", "table-definitions.yaml", "Name of table definitions yaml to use")
	t.listTables = flag.Bool("l", false, "List tables")
	t.showTable = flag.String("t", "", "Describe table")

	return nil
}

func (t *TableDefinitions) PostInit() error {
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
		if v.Name == "" {
			v.Name = k
		}

		err = v.getSqlTable()
		if err != nil {
			return err
		}
	}

	if *t.listTables {
		t.showTables()
	} else if *t.showTable != "" {
		err = t.describeTable()
	} else {
		return errors.New("Requires one of -l or -t. Try -h for a list of options")
	}

	return err
}

func (t *TableDefinitions) showTables() {
	fmt.Println("List of available tables")

	// Get a list of categories and tables
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

	for _, c := range cat {
		fmt.Printf("\nCategory: %s\n", c)
		for _, n := range cats[c] {

			table := t.tables[n]
			fmt.Printf("    %-16s %s\n", n, table.Description)
		}
	}

	os.Exit(0)
}

func (t *TableDefinitions) describeTable() error {

	table, exists := t.tables[*t.showTable]
	if !exists {
		return fmt.Errorf("Unknown table %s", *t.showTable)
	}

	for _, s := range table.sql("planet", "osm") {
		if strings.HasPrefix(s, "-- ") {
			fmt.Println(s)
		} else {
			fmt.Println(s + ";\n")
		}
	}

	os.Exit(0)
	return nil
}
