# OSM 2019 Project

For 2019 I'm looking at making better looking maps rather than the old mapnik data set
and leveraging both PostGIS and GeoServer more.

So in this dataset I'm starting to look at using [osmgwc](https://github.com/fegyi001/osmgwc) as the base
CSS styles and a custom version of their SQL on the UKIE OSGB extracts from [geofabrik](https://download.geofabrik.de/index.html).

## Importing data from geofabrik

The following script defines the importing of a single countries extract from geofabrik,
in this instance [british-isles-latest.osm.pbf](https://download.geofabrik.de/europe/british-isles.html):

```bash
#!/bin/sh

# DB config
POSTGRES_DB=postgres
POSTGRES_HOST=postgis
POSTGRES_USER=postgres
POSTGIS_PASSWORD=password

# osm2pgsql version
VERSION=latest

# run the osm2pgsql instance
# The osm-importer.sh script will run osmupdate every 600 seconds,
# to pull latest osm data from
exec docker run \
    -it --rm \
    --name osm2pgsql \
    --network styxnet \
    -v $(pwd):/data \
    -w /data \
    -e PGPASSWORD=${POSTGIS_PASSWORD} \
    osmtw/osm2pgsql:${VERSION} \
    osm2pgsql \
	--host ${POSTGRES_HOST} \
	--database ${POSTGRES_DB \
	--username ${POSTGRES_USER} \
	--create \
	--number-processes 8 \
	--cache 32767 \
	--keep-coastlines \
	british-isles-latest.osm.pbf
```

### Notes
* `--cache 32767` defines the cache size, here 32GB of RAM which will speed things up.
* `--keep-coastlines` keeps the coastlines, normally these are removed for mapnik but we'll want them.
* `british-isles-latest.osm.pbf` is the .osm.pbf to import. Make certain it's in the current directory when the script is run.
* `--network styxnet` is specific to my local docker network, you can leave it out.
