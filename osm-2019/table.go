package osm_2019

import (
	"fmt"
	"strings"
)

type Table struct {
	Headers []*TableHeader
	Rows    []*TableRow
}

type TableHeader struct {
	Text  string
	width int
}

type TableRow struct {
	Cells []*TableCell
}

type TableCell struct {
	Text string
}

func (t *Table) Header(s ...string) *Table {
	for _, h := range s {
		t.Headers = append(t.Headers, &TableHeader{Text: h})
	}
	return t
}

func (t *Table) AddRow() *TableRow {
	r := &TableRow{}
	t.Rows = append(t.Rows, r)
	return r
}

func (r *TableRow) Add(s ...string) *TableRow {
	for _, v := range s {
		r.Cells = append(r.Cells, &TableCell{Text: v})
	}
	return r
}

func (c *TableCell) toString(w int) string {
	if c == nil || c.Text == "" {
		return strings.Repeat(" ", w)
	}

	return cellToString(c.Text, w)
}

func cellToString(s string, w int) string {
	if s == "" {
		return strings.Repeat(" ", w)
	}

	if len(s) > w {
		return s[:w]
	}

	return s + strings.Repeat(" ", w-len(s))
}

func rowToString(s []string) string {
	return "| " + strings.Join(s, " | ") + " |"
}

func (t *Table) String() string {
	// Calculate the cell widths
	for _, h := range t.Headers {
		h.width = len(h.Text)
	}
	for _, r := range t.Rows {
		for i, c := range r.Cells {
			var h *TableHeader
			if i >= len(t.Headers) {
				t.Header(fmt.Sprintf("Column %d", i))
				h = t.Headers[i]
				h.width = len(h.Text)
			} else {
				h = t.Headers[i]
			}

			if c != nil {
				l := len(c.Text)
				if l > h.width {
					h.width = l
				}
			}
		}
	}

	var l []string
	var hs []string
	// line separator
	for _, h := range t.Headers {
		l = append(l, strings.Repeat("-", h.width))
		hs = append(hs, cellToString(h.Text, h.width))
	}
	sep := "+-" + strings.Join(l, "-+-") + "-+"

	var out []string
	out = append(out, sep, rowToString(hs), sep)

	for _, r := range t.Rows {
		l = nil
		for i, c := range r.Cells {
			l = append(l, c.toString(t.Headers[i].width))
		}
		out = append(out, rowToString(l), sep)
	}

	return strings.Join(out, "\n")
}
