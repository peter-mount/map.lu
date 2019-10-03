package osm_2019

import (
	"errors"
	"flag"
	"github.com/peter-mount/golib/kernel"
	"log"
	"net/url"
	"os"
	"os/exec"
	"path"
)

// Dump handles the dumping of the database into files usable with pg_restore
type Dump struct {
	dockerImage      *string           // Docker image name (optional)
	outputDirectory  *string           // Directory to write data to
	nestDirectories  *bool             // If true store in subdirectory named by category
	tableDefinitions *TableDefinitions // Link to TableDefinitions service
	dbuser           *url.Userinfo     // DB user
}

func (d *Dump) Name() string {
	return "Dump"
}

func (d *Dump) Init(k *kernel.Kernel) error {
	service, err := k.AddService(&TableDefinitions{})
	if err != nil {
		return err
	}
	d.tableDefinitions = (service).(*TableDefinitions)

	d.dockerImage = flag.String("docker-image", "", "Docker image to run pg_dump under")
	d.outputDirectory = flag.String("dump-dir", "", "Directory to store dump files")
	d.nestDirectories = flag.Bool("dump-nest", false, "If set then use subdirectory per category")
	return nil
}

func (d *Dump) PostInit() error {
	// Do nothing if no output directory
	if !*d.tableDefinitions.useDBFlag ||
		d.outputDirectory == nil || *d.outputDirectory == "" {
		return nil
	}

	// Create the output directory
	err := os.MkdirAll(*d.outputDirectory, 0755)
	if err != nil {
		return err
	}

	// Get the DB user name for pg_dump
	uri := os.Getenv("POSTGRESDB")
	if uri == "" {
		return errors.New("No DB URI configured in POSTGRESDB environment variable")
	}
	ur, err := url.Parse(uri)
	if err != nil {
		return err
	}
	d.dbuser = ur.User
	if d.dbuser == nil {
		return errors.New("POSTGRESDB has no credentials in it")
	}

	return nil
}

func (d *Dump) Run() error {
	// Do nothing if no output directory or just listing or inspecting tables
	if !*d.tableDefinitions.useDBFlag ||
		d.outputDirectory == nil || *d.outputDirectory == "" ||
		*d.tableDefinitions.listTablesFlag || *d.tableDefinitions.inspectTableFlag != "" {
		return nil
	}

	var err error

	if *d.tableDefinitions.importTableFlag != "" {
		err = d.dumpNamedTable(*d.tableDefinitions.importTableFlag)
	} else if *d.tableDefinitions.importAllTablesFlag {
		err = d.dumpAll()
	} else if *d.tableDefinitions.importCategoryFlag != "" {
		err = d.dumpCategory(*d.tableDefinitions.importCategoryFlag)
	}
	if err != nil {
		return err
	}

	return nil
}

func (d *Dump) mkdir(category string) (string, error) {
	var p string
	if *d.nestDirectories {
		p = path.Join(*d.outputDirectory, category)
	} else {
		p = *d.outputDirectory
	}

	return p, os.MkdirAll(p, 0755)
}

// Dump all tables by category
func (d *Dump) dumpAll() error {
	log.Println("Dumping all tables")
	cat, _ := d.tableDefinitions.getCategories()
	for _, catName := range cat {
		err := d.dumpCategory(catName)
		if err != nil {
			return err
		}
	}
	return nil
}

// Dump all tables in a category. This will also create a tar & zip archive of all tables
func (d *Dump) dumpCategory(catName string) error {
	log.Printf("Dumping category %s", catName)

	var tableFiles []string

	tables, err := d.tableDefinitions.GetCategory(catName)
	if err != nil {
		return err
	}

	for _, tableName := range tables {
		table, err := d.tableDefinitions.GetTable(tableName)
		if err != nil {
			return err
		}

		fileName, err := d.dumpTable(table)
		if err != nil {
			return err
		}

		tableFiles = append(tableFiles, fileName)
	}

	archivePrefix := catName + "_all"
	if *d.nestDirectories {
		archivePrefix = path.Join(catName, archivePrefix)
	}

	err = d.archive("tar", "-cvpf", archivePrefix+".tar", tableFiles)
	if err != nil {
		return err
	}

	err = d.archive("zip", "-0", archivePrefix+".zip", tableFiles)
	if err != nil {
		return err
	}

	return nil
}

func (d *Dump) archive(cmdName, arg, fileName string, files []string) error {
	// Remove any existing archive
	err := os.Remove(path.Join(*d.outputDirectory, fileName))
	if err != nil && !os.IsNotExist(err) {
		return err
	}

	log.Printf("Generating %s archive", cmdName)

	args := []string{arg, fileName}
	args = append(args, files...)

	cmd := exec.Command(cmdName, args...)
	cmd.Dir = *d.outputDirectory
	return cmd.Run()
}

// Dump just a single table
func (d *Dump) dumpNamedTable(tableName string) error {

	table, err := d.tableDefinitions.GetTable(tableName)
	if err != nil {
		return err
	}

	_, err = d.dumpTable(table)
	if err != nil {
		return err
	}

	return nil
}

// Dump a table
func (d *Dump) dumpTable(t *TableDefinition) (string, error) {
	log.Printf("Dumping table %s", t.Name)
	p, err := d.mkdir(t.Category)
	if err != nil {
		return "", err
	}

	fileName := t.Name + ".dump.gz"
	p = path.Join(p, fileName)

	var cmdName string
	var args []string

	if *d.dockerImage != "" {
		cmdName = "docker"
		args = append(args, "exec", "-i", *d.dockerImage, "pg_dump")
	} else {
		cmdName = "pg_dump"
	}

	args = append(args,
		"-Fc",
		"-U", d.dbuser.Username(),
		"-v", "-O",
		"-t", *d.tableDefinitions.schema+"."+t.Name,
	)

	cmd := exec.Command(cmdName, args...)

	// PGPASSWORD
	if pass, set := d.dbuser.Password(); set {
		cmd.Env = append(cmd.Env, "PGPASSWORD="+pass)
	}

	// The output dump file
	file, err := os.OpenFile(p, os.O_CREATE|os.O_TRUNC|os.O_WRONLY, 0644)
	if err != nil {
		log.Println("DarwinKB:", err)
		return "", err
	}
	defer file.Close()
	cmd.Stdout = file

	err = cmd.Run()
	if err != nil {
		return "", err
	}

	if *d.nestDirectories {
		return path.Join(t.Category, fileName), nil
	} else {
		return fileName, nil
	}
}
