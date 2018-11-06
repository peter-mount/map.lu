-- ======================================================================
--       Table: railway_point
-- Description: Entries from planet_osm_point where railway IS NOT NULL
--     Created: 2018-10-19
-- ======================================================================

CREATE SCHEMA IF NOT EXISTS railway;

DROP TABLE IF EXISTS railway.railway_point CASCADE;

CREATE TABLE railway.railway_point
  AS SELECT * FROM planet_osm_point WHERE railway IS NOT NULL;

CREATE INDEX railway_point_id_idx
  ON railway.railway_point
  USING btree (osm_id);

CREATE INDEX railway_point_railway_idx
  ON railway.railway_point
  USING btree (railway);

CREATE INDEX railway_point_way_idx
  ON railway.railway_point
  USING gist (way);

ALTER TABLE railway.railway_point
  CLUSTER ON railway_point_way_idx;
