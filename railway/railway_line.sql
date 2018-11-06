-- ======================================================================
--       Table: railway_line
-- Description: Entries from planet_osm_line where railway IS NOT NULL
--     Created: 2018-10-19
-- ======================================================================

CREATE SCHEMA IF NOT EXISTS railway;

DROP TABLE IF EXISTS railway.railway_line CASCADE;

CREATE TABLE railway.railway_line
  AS SELECT * FROM planet_osm_line WHERE railway IS NOT NULL;

CREATE INDEX railway_line_id_idx
  ON railway.railway_line
  USING btree (osm_id);

CREATE INDEX railway_line_railway_idx
  ON railway.railway_line
  USING btree (railway);

CREATE INDEX railway_line_route_idx
  ON railway.railway_line
  USING btree (route);

CREATE INDEX railway_line_way_idx
  ON railway.railway_line
  USING gist (way);

ALTER TABLE railway.railway_line
  CLUSTER ON railway_line_way_idx;
