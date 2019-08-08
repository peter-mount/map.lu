package osm_2019

import (
	"fmt"
	"strings"
	"unicode"
)

type SqlTable struct {
	Name    string
	Columns []SqlColumn
}

type SqlColumn struct {
	Name       string
	Type       string
	Flags      string
	Expression string
	Synthetic  bool
	PrimaryKey bool
}

func (t TableDefinition) sql(prefix, schema string) []string {
	var a []string

	f := func(a []string, l, v string) []string {
		if v != "" {
			return append(a, fmt.Sprintf("-- %-10s %s", l, v))
		}
		return a
	}

	sep := "-- " + strings.Repeat("=", 70)
	a = append(a, sep)
	a = f(a, "Schema", schema)
	a = f(a, "Table", t.Name)
	a = f(a, "Description", t.Description)
	a = f(a, "Category", t.Category)
	a = f(a, "Type", t.Type)
	a = append(a, sep)

	st := t.SqlTable
	return append(a,
		fmt.Sprintf("CREATE SCHEMA IF NOT EXISTS %s", schema),
		fmt.Sprintf("DROP TABLE %s.%s", schema, st.Name),
		st.createSql(schema),
		fmt.Sprintf("CREATE INDEX gix_%s ON %s.%s USING gist (geom)", st.Name, schema, st.Name),
		st.insertSql(prefix, schema, t.Type, t.Where),
	)
}

func (t SqlTable) createSql(schema string) string {
	cl := 6
	tl := 0
	for _, c := range t.Columns {
		l := len(c.Name)
		if l > cl {
			cl = l
		}

		l = len(c.Type)
		if l > tl {
			tl = l
		}
	}
	sfmt := fmt.Sprintf("    %%-%ds %%-%ds %%s", cl, tl)

	s := []string{
		fmt.Sprintf("CREATE TABLE %s.%s", schema, t.Name),
		"(",
	}

	suffix := ","
	for i, c := range t.Columns {
		if (i + 1) == len(t.Columns) {
			suffix = ""
		}
		s = append(s, strings.TrimRightFunc(fmt.Sprintf(sfmt, c.Name, c.Type, c.Flags), unicode.IsSpace)+suffix)
	}
	s = append(s, ")")
	return strings.Join(s, "\n")
}

func (t SqlTable) insertSql(prefix, schema, featuretype, where string) string {
	var s []string

	s = append(s)

	sfmt := fmt.Sprintf("INSERT INTO %s.%s ( ", schema, t.Name)
	efmt := strings.Repeat(" ", len(sfmt)) + "%s"
	sfmt = sfmt + "%s"
	suffix := ","
	for i, c := range t.Columns {
		if (i + 1) == len(t.Columns) {
			suffix = " )"
		}
		if !c.PrimaryKey {
			s = append(s, strings.TrimRightFunc(fmt.Sprintf(sfmt, c.Name), unicode.IsSpace)+suffix)
			if sfmt[0] != ' ' {
				sfmt = efmt
			}
		}
	}

	sfmt = "SELECT %s"
	efmt = "       %s"
	suffix = ","
	for i, c := range t.Columns {
		if (i + 1) == len(t.Columns) {
			suffix = ""
		}
		if !c.PrimaryKey {
			expr := c.Name
			if c.Expression != "" {
				expr = c.Expression
			}
			s = append(s, strings.TrimRightFunc(fmt.Sprintf(sfmt, expr), unicode.IsSpace)+suffix)
			sfmt = efmt
		}
	}
	s = append(s, fmt.Sprintf("FROM %s_%s", prefix, featuretype))

	if where != "" {
		sfmt = "WHERE "
		for _, l := range strings.Split(where, "\n") {
			if l != "" && l != "\n" {
				s = append(s, sfmt+l)
				if sfmt[0] != ' ' {
					sfmt = "      "
				}
			}
		}
	}

	return strings.Join(s, "\n")
}

func (t *TableDefinition) getSqlTable() error {
	st := &t.SqlTable
	st.Name = t.Name

	// Our 2 mandatory columns at the start
	st.Columns = append(st.Columns, SqlColumn{
		Name:       "id",
		Type:       "SERIAL",
		Flags:      "NOT NULL PRIMARY KEY",
		Synthetic:  true,
		PrimaryKey: true,
	})
	st.Columns = append(st.Columns, SqlColumn{
		Name:      "osm_id",
		Type:      "INTEGER",
		Flags:     "NOT NULL",
		Synthetic: true,
	})

	for _, c := range t.Columns {
		col := SqlColumn{}
		eq := strings.Index(c, "=")
		if eq > -1 {
			col.Expression = strings.TrimSpace(c[eq+1:])
			c = c[:eq]
		}

		eq = strings.Index(c, " ")
		if eq > -1 {
			col.Type = strings.TrimSpace(c[eq+1:])
			c = c[:eq]
		}

		col.Name = strings.TrimSpace(c)
		if col.Type == "" {
			col.Type = "TEXT"
		} else {
			col.Type = strings.ToUpper(col.Type)
		}

		st.Columns = append(st.Columns, col)
	}

	// Finally the geometry
	var geom string
	var expr string
	switch t.Type {
	case "polygon":
		geom = "geometry(MultiPolygon, 3857)"
		expr = "st_multi(way)::geometry(MultiPolygon, 3857)"
	case "line":
		geom = "geometry(MultiLinestring, 3857)"
		expr = "st_multi(way)::geometry(MultiLinestring, 3857)"
	}
	st.Columns = append(st.Columns, SqlColumn{
		Name:       "geom",
		Type:       geom,
		Expression: expr,
		Flags:      "NOT NULL",
		Synthetic:  true,
	})

	return nil
}
