-- ======================================================================
--       Table: railway_polygon
-- Description: Entries from planet_osm_polygon where railway IS NOT NULL
--     Created: 2018-10-19
-- ======================================================================

CREATE SCHEMA IF NOT EXISTS railway;

DROP TABLE IF EXISTS railway.railway_polygon CASCADE;

CREATE TABLE railway.railway_polygon
  AS SELECT * FROM planet_osm_polygon WHERE railway IS NOT NULL;

CREATE INDEX railway_polygon_id_idx
  ON railway.railway_polygon
  USING btree (osm_id);

CREATE INDEX railway_polygon_railway_idx
  ON railway.railway_polygon
  USING btree (railway);

CREATE INDEX railway_polygon_route_idx
  ON railway.railway_polygon
  USING btree (route);

CREATE INDEX railway_polygon_way_idx
  ON railway.railway_polygon
  USING gist (way);

ALTER TABLE railway.railway_polygon
  CLUSTER ON railway_polygon_way_idx;
