package main

import (
	"github.com/peter-mount/golib/kernel"
	osm_2019 "github.com/peter-mount/map.lu/osm-2019"
	"log"
)

func main() {
	err := kernel.Launch(
		&osm_2019.Dump{},
		&osm_2019.TableDefinitions{},
	)
	if err != nil {
		log.Fatal(err)
	}
}
