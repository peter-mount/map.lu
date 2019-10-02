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

func (t TableDefinition) sql(a []string, prefix, schema string) []string {
	sep := "-- " + strings.Repeat("=", 70)
	a = append(a, sep)

	if t.Description != "" {
		a = splitText(a, "-- ", t.Description, -1)
		a = append(a, "-- ")
	}

	f := func(a []string, l, v string) []string {
		if v != "" {
			return splitText(a, fmt.Sprintf("-- %-10s", l), v, -1)
		}
		return a
	}

	a = f(a, "Table", t.Name)
	a = f(a, "Schema", schema)
	a = f(a, "Category", t.Category)
	a = f(a, "Type", t.Type)
	a = append(a, sep)

	st := t.sqlTable
	a = append(a,
		fmt.Sprintf("CREATE SCHEMA IF NOT EXISTS %s", schema),
		fmt.Sprintf("DROP TABLE IF EXISTS %s.%s", schema, st.Name),
		st.createSql(schema),
		st.insertSql(prefix, schema, t.Type, t.Where),
		// index using gist
		//fmt.Sprintf("CREATE INDEX gix_%s ON %s.%s USING gist (geom)", st.Name, schema, st.Name),
		// trialling geohash index
		fmt.Sprintf("CREATE INDEX geohash_%s ON %s.%s (ST_GeoHash(ST_Transform(geom,4326)))", st.Name, schema, st.Name),
		// cluster by index
		fmt.Sprintf("CLUSTER %s.%s USING geohash_%s", schema, st.Name, st.Name),
	)

	if len(t.Index) > 0 {
		a = append(a, st.indexSql(prefix, schema, t.Index)...)
	}

	return a
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

func (t SqlTable) indexSql(prefix, schema string, indices []string) []string {
	var s []string

	for i, in := range indices {
		s = append(s, fmt.Sprintf("CREATE INDEX %s_%d ON %s.%s (%s)", t.Name, i, schema, t.Name, in))
	}

	return s
}

func splitString(s string, i int) (string, string) {
	if i > len(s) {
		i = len(s)
	}
	l := strings.TrimFunc(s[:i], unicode.IsSpace)
	r := ""
	if i < len(s) {
		r = strings.TrimFunc(s[i+1:], unicode.IsSpace)
	}
	return l, r
}
func splitPrefix(a []string, p, s string, i int) ([]string, string) {
	l, r := splitString(s, i)
	return append(a, p+l), r
}
func splitText(a []string, p, s string, l int) []string {
	// Ensure we have a valid value
	if l < 10 {
		l = 70
	}
	for _, v := range strings.Split(s, "\n") {
		for v != "" {
			var i int
			if len(v) < l {
				i = l
			} else {
				i = strings.LastIndex(v[:l], " ")
				if i < 1 {
					i = l
				}
			}
			a, v = splitPrefix(a, p, v, i)
		}
	}
	return a
}

// generateSqlTable creates the sqlTable based on the TableDefinition
func (t *TableDefinition) generateSqlTable(srid int) error {
	st := &t.sqlTable
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
		Type:      "BIGINT",
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
		geom = fmt.Sprintf("geometry(MultiPolygon, %d)", srid)
		expr = fmt.Sprintf("st_multi(way)::geometry(MultiPolygon, %d)", srid)
	case "line":
		geom = fmt.Sprintf("geometry(MultiLinestring, %d)", srid)
		expr = fmt.Sprintf("st_multi(way)::geometry(MultiLinestring, %d)", srid)
	case "point":
		geom = fmt.Sprintf("geometry(MultiPoint, %d)", srid)
		expr = fmt.Sprintf("st_multi(way)::geometry(MultiPoint, %d)", srid)
	case "":
		return fmt.Errorf("Table %s has no type defined", t.Name)
	default:
		return fmt.Errorf("Table %s has unsupported type %s", t.Name, t.Type)
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
