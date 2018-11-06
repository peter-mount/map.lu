#!/bin/sh
#
# Creates the railway_point table as an extract from planet_osm_point
# for all entries where railway is not null.
#
# Created: 2018-10-19
#

DATABASE=gis
TABLE=railway_point

psql -f ${DATABASE}.sql $DATABASE || die "Failed to extract $TABLE"

pg_dump -Fc -n public

(
  pg_dump
