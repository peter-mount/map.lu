#!/bin/bash

DATABASE=gis
SCHEMA=railway

TABLES="railway_line railway_point railway_polygon railway_roads"

die() { echo "$*" 1>&2 ; exit 1; }

for TABLE in ${TABLES}
do
  echo "Creating table ${SCHEMA}.${TABLE}"
  psql -f ${TABLE}.sql ${DATABASE} || die "Failed to extract table ${TABLE}"
done

for TABLE in ${TABLES}
do
  echo "Creating dump for table ${TABLE}"
  ./export.sh ${DATABASE} ${SCHEMA} ${TABLE} || die "Failed to dump table ${TABLE}"
done

echo "Creating dump for schema ${SCHEMA}"
./export.sh ${DATABASE} ${SCHEMA} || die "Failed to dump schema ${TABLE}"
