package osm_2019

import (
	"database/sql"
	"fmt"
	"strconv"
)

// inspectTable is an optimisation tool that queries the db and returns a table of the number
// of unique values for each column.
//
// If it's just a single value then that is put into the table. This could mean that the column
// might be unnecessary.
//
// If no values are present then "NO DATA" is put in there. This would mean that the column can
// be removed from the table.
func (t *TableDefinitions) inspectTable() error {

	table, exists := t.tables[*t.inspectTableFlag]
	if !exists {
		return fmt.Errorf("Unknown table %s", *t.inspectTableFlag)
	}

	fmt.Printf("Inspecting table %s.%s\n", *t.schema, table.Name)

	// The number of rows in the table
	rowCount, err := t.inspectTableRowCount(table)
	if err != nil {
		return err
	}

	sheet := &Table{}
	sheet.Header("Col", "Column", "Type", "Unique Values")

	for colNum, column := range table.sqlTable.Columns {
		if !column.Synthetic {
			valCount, err := t.inspectTableCol(table, column)
			if err != nil {
				return err
			}

			_ = sheet.AddRow().Add(strconv.Itoa(colNum+1), column.Name, column.Type, valCount)
		}
	}

	fmt.Printf("\nSchema: %s\n Table: %s\n  Rows: %d\n\n", *t.schema, table.Name, rowCount)
	fmt.Println(sheet.String())
	return nil
}

const inspectTableColSql = "with v as (select distinct %s::text from %s.%s)" +
	" select CASE" +
	"  when (select count(*) from v)>1 then  (select count(*) from v)::text" +
	"  when (select * from v limit 1) is null then 'NO DATA'" +
	"  else (select * from v limit 1)" +
	" end"

func (t *TableDefinitions) inspectTableCol(table *TableDefinition, column SqlColumn) (string, error) {
	r := t.db.QueryRow(fmt.Sprintf(inspectTableColSql, column.Name, *t.schema, table.Name))
	var s sql.NullString
	err := r.Scan(&s)
	if err != nil {
		return "", err
	}
	if s.Valid {
		return s.String, nil
	}
	return "", nil
}

func (t *TableDefinitions) inspectTableRowCount(table *TableDefinition) (int, error) {
	r := t.db.QueryRow(fmt.Sprintf("SELECT count(id) FROM %s.%s", *t.schema, table.Name))
	var rowCount int
	err := r.Scan(&rowCount)
	return rowCount, err
}
