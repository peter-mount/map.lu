#!/bin/bash
#
# Script to extract a table and create an export file.
#
# The format of this file is similar to the trial format the
# UK's Ordnance Survey used recently with their OS Open Data maps.
#
# Useage:
#
# export.sh database schema [table]
#
# If table is not present then the entire schema is exported.

DATABASE=$1
SCHEMA=$2
TABLE=$3

if [ -z "$DATABASE" -o -z "$SCHEMA" ]
then
  echo "Useage: $0 database schema [table]"
  exit 1
fi

if [ ! -z "$TABLE" ]
then
  FILENAME=${TABLE}.dump.gz
  CMD="-t ${SCHEMA}.${TABLE}"
  echo Exporting ${SCHEMA}.${TABLE} from $DATABASE to $FILENAME
else
  FILENAME=${SCHEMA}.dump.gz
  CMD="-n ${SCHEMA}"
  echo Exporting schema ${SCHEMA} from $DATABASE to $FILENAME
fi

pg_dump -Fc $CMD -v -O $DATABASE >$FILENAME
