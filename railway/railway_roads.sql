-- ======================================================================
--       Table: railway_roads
-- Description: Entries from planet_osm_roads where railway IS NOT NULL
--     Created: 2018-10-29
-- ======================================================================

CREATE SCHEMA IF NOT EXISTS railway;

DROP TABLE IF EXISTS railway.railway_roads CASCADE;

CREATE TABLE railway.railway_roads
  AS SELECT * FROM planet_osm_roads WHERE railway IS NOT NULL;

CREATE INDEX railway_roads_id_idx
  ON railway.railway_roads
  USING btree (osm_id);

CREATE INDEX railway_roads_railway_idx
  ON railway.railway_roads
  USING btree (railway);

CREATE INDEX railway_roads_route_idx
  ON railway.railway_roads
  USING btree (route);

CREATE INDEX railway_roads_way_idx
  ON railway.railway_roads
  USING gist (way);

ALTER TABLE railway.railway_roads
  CLUSTER ON railway_roads_way_idx;
