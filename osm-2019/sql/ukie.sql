-- ==============================================================================================================
create schema if not exists osm;

-- ==============================================================================================================
-- Administrative boundaries
--
-- These have planet_osm_polygon.boundary = 'administrative' and admin_level of:
--
-- '2' & place is null  for the UK, Ireland, Isle of Man, Jersey
--
-- '4' & place is null  for England, Scotland, Wales, Guernsey.
-- '4' & place='state'  for Sark & Alderney
--
-- '5' & place is null  for Regions like South East, West Midlands etc
--
-- '6' & place is null  for counties in the UK
-- '6' & place='county' for counties in Ireland
-- '6' & place='island' for islands in Ireland
-- ==============================================================================================================

drop table if exists osm.country;
create table osm.country
(
    id          serial not null primary key,
    osm_id      integer,
    name        text,
    uppername   text,
    admin_level text,
    geom        geometry(multipolygon, 3857)
);
create index gix_country on osm.country using gist (geom);
insert into osm.country(osm_id, name, uppername, admin_level, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       admin_level,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '2'::text
  AND planet_osm_polygon.boundary = 'administrative';

drop table if exists osm.boundary;
create table osm.boundary
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_boundary on osm.boundary using gist (geom);
insert into osm.boundary(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
--WHERE planet_osm_polygon.admin_level = '2'::text
WHERE planet_osm_polygon.admin_level in ('2', '4')
  AND planet_osm_polygon.boundary = 'administrative';

drop table if exists osm.county;
create table osm.county
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_county on osm.county using gist (geom);
--delete from osm.county;
insert into osm.county(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE (planet_osm_polygon.place = 'county' OR
       planet_osm_polygon.admin_level = '6')
  AND planet_osm_polygon.boundary = 'administrative';

-- ==============================================================================================================

drop table if exists osm.district;
create table osm.district
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_district on osm.district using gist (geom);
insert into osm.district(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '9'::text
  AND planet_osm_polygon.boundary = 'administrative'::text;

-- ==============================================================================================================

drop table if exists osm.amenity;
create table osm.amenity
(
    id     serial not null primary key,
    osm_id integer,
    geom   geometry(multipolygon, 3857)
);
create index gix_amenity on osm.amenity using gist (geom);
insert into osm.amenity(osm_id, geom)
SELECT planet_osm_polygon.osm_id,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.amenity IS NOT NULL
  AND (planet_osm_polygon.amenity = ANY
       (ARRAY ['college'::text, 'community_centre'::text, 'courthouse'::text, 'doctors'::text, 'embassy'::text, 'grave_yard'::text, 'hospital'::text, 'library'::text, 'marketplace'::text, 'prison'::text, 'public_building'::text, 'school'::text, 'simming_pool'::text, 'theatre'::text, 'townhall'::text, 'university'::text]));

-- ==============================================================================================================

drop table if exists osm.buildings;
create table osm.buildings
(
    id          serial not null primary key,
    osm_id      integer,
    name        text,
    housename   text,
    housenumber text,
    geom        geometry(multipolygon, 3857)
);
create index gix_buildings on osm.buildings using gist (geom);
insert into osm.buildings(osm_id, name, housename, housenumber, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       planet_osm_polygon."addr:housename",
       planet_osm_polygon."addr:housenumber",
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.building IS NOT NULL
  AND st_area(planet_osm_polygon.way) < 100000::double precision;

-- ==============================================================================================================

-- ==============================================================================================================

drop table if exists osm.forestpark;
create table osm.forestpark
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multipolygon, 3857)
);
create index gix_forestpark on osm.forestpark using gist (geom);
insert into osm.forestpark(osm_id, name, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE (planet_osm_polygon.landuse = ANY
       (ARRAY ['forest'::text, 'orchard'::text, 'park'::text, 'plant_nursery'::text, 'grass'::text, 'greenfield'::text, 'meadow'::text, 'recreation_ground'::text, 'village_green'::text, 'vineyard'::text]))
   OR (planet_osm_polygon.leisure = ANY
       (ARRAY ['nature_reserve'::text, 'park'::text, 'dog_park'::text, 'garden'::text, 'golf_course'::text, 'horse_riding'::text, 'recreation_ground'::text, 'stadium'::text]));

-- ==============================================================================================================

drop table if exists osm.lakes;
create table osm.lakes
(
    id       serial not null primary key,
    osm_id   integer,
    name     text,
    way_area real,
    geom     geometry(multipolygon, 3857)
);
create index gix_lakes on osm.lakes using gist (geom);
insert into osm.lakes(osm_id, name, way_area, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       planet_osm_polygon.way_area,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon."natural" = 'water'::text
  AND (planet_osm_polygon.water IS NULL OR
       planet_osm_polygon.water IS NOT NULL AND planet_osm_polygon.water <> 'river'::text);

-- ==============================================================================================================

drop table if exists osm.minor_roads;
create table osm.minor_roads
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_minor_roads on osm.minor_roads using gist (geom);
insert into osm.minor_roads(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.highway IS NOT NULL AND (planet_osm_line.highway <> ALL
                                               (ARRAY ['motorway'::text, 'motorway_link'::text, 'trunk'::text, 'primary'::text, 'trunk_link'::text, 'primary_link'::text, 'secondary'::text, 'secondary_link'::text, 'road'::text, 'tertiary'::text, 'tertiary_link'::text, 'steps'::text, 'footway'::text, 'path'::text, 'pedestrian'::text, 'walkway'::text, 'service'::text, 'track'::text])) AND
      planet_osm_line.railway IS NULL
   OR planet_osm_line.railway = 'no'::text;

-- ==============================================================================================================

drop table if exists osm.motorway;
create table osm.motorway
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_motorway on osm.motorway using gist (geom);
insert into osm.motorway(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.highway = 'motorway'::text;

-- ==============================================================================================================

drop table if exists osm.pedestrian;
create table osm.pedestrian
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_pedestrian on osm.pedestrian using gist (geom);
insert into osm.pedestrian(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.highway = ANY
      (ARRAY ['steps'::text, 'footway'::text, 'path'::text, 'pedestrian'::text, 'walkway'::text, 'service'::text, 'track'::text]);

-- ==============================================================================================================

drop table if exists osm.rails;
create table osm.rails
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_rails on osm.rails using gist (geom);
--delete from osm.rails;
insert into osm.rails(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.railway IS NOT NULL AND (planet_osm_line.railway = ANY
                                               (ARRAY ['light rail'::text, 'rail'::text, 'rail;construction'::text, 'tram'::text, 'yes'::text, 'traverser'::text]))
   OR planet_osm_line.railway ~~ '%rail%'::text;

-- ==============================================================================================================

drop table if exists osm.roads;
create table osm.roads
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_roads on osm.roads using gist (geom);
insert into osm.roads(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.highway = ANY
      (ARRAY ['trunk_link'::text, 'primary_link'::text, 'secondary'::text, 'secondary_link'::text, 'road'::text, 'tertiary'::text, 'tertiary_link'::text]);

-- ==============================================================================================================

drop table if exists osm.settlements;
create table osm.settlements
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    way_area  real,
    geom      geometry(multipolygon, 3857)
);
create index gix_settlements on osm.settlements using gist (geom);
insert into osm.settlements(osm_id, name, uppername, way_area, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       planet_osm_polygon.way_area,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '8'::text
  AND planet_osm_polygon.boundary = 'administrative'::text;

-- ==============================================================================================================

drop table if exists osm.subdistrict;
create table osm.subdistrict
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_subdistrict on osm.subdistrict using gist (geom);
insert into osm.subdistrict(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '10'::text
  AND planet_osm_polygon.boundary = 'administrative'::text;

-- ==============================================================================================================

drop table if exists osm.trunk_primary;
create table osm.trunk_primary
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multilinestring, 3857)
);
create index gix_trunk_primary on osm.trunk_primary using gist (geom);
insert into osm.trunk_primary(osm_id, name, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.highway = ANY (ARRAY ['motorway_link'::text, 'trunk'::text, 'primary'::text]);

-- ==============================================================================================================

drop table if exists osm.water;
create table osm.water
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multipolygon, 3857)
);
create index gix_water on osm.water using gist (geom);
insert into osm.water(osm_id, name, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon."natural" = 'water'::text
   OR planet_osm_polygon.water IS NOT NULL
   OR planet_osm_polygon.waterway ~~ '%riverbank%'::text;

-- ==============================================================================================================

drop table if exists osm.waterway;
create table osm.waterway
(
    id       serial not null primary key,
    osm_id   integer,
    name     text,
    waterway text,
    geom     geometry(multilinestring, 3857)
);
create index gix_waterway on osm.waterway using gist (geom);
insert into osm.waterway(osm_id, name, waterway, geom)
SELECT planet_osm_line.osm_id,
       planet_osm_line.name,
       planet_osm_line.waterway,
       st_multi(planet_osm_line.way)::geometry(MultiLineString, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.waterway = ANY
      (ARRAY ['drain'::text, 'canal'::text, 'waterfall'::text, 'river'::text, 'stream'::text, 'yes'::text]);


-- ==============================================================================================================
