-- ==============================================================================================================
create schema if not exists osm;

-- ==============================================================================================================
-- Coastline - valid if osm2pgsql was run with keep coastlines in the import
--
-- There's 2 tables, one for polygons and the other for lines.

drop table if exists osm.coastline_poly;
create table osm.coastline_poly
(
    id     serial not null primary key,
    osm_id integer,
    geom   geometry(multipolygon, 3857)
);
create index gix_coastline_poly on osm.coastline_poly using gist (geom);
insert into osm.coastline_poly(osm_id, geom)
SELECT planet_osm_polygon.osm_id,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.natural = 'coastline';

drop table if exists osm.coastline_line;
create table osm.coastline_line
(
    id     serial not null primary key,
    osm_id integer,
    geom   geometry(multilinestring, 3857)
);
create index gix_coastline_line on osm.coastline_line using gist (geom);
insert into osm.coastline_line(osm_id, geom)
SELECT planet_osm_line.osm_id,
       st_multi(planet_osm_line.way)::geometry(multilinestring, 3857) as way
FROM planet_osm_line
WHERE planet_osm_line.natural = 'coastline';

-- ==============================================================================================================
-- Administrative boundaries
--
-- These are broken down into Country, State, Region & County.
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

-- Country with admin_level 2
-- e.g. United Kingdom
drop table if exists osm.country;
create table osm.country
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_country on osm.country using gist (geom);
insert into osm.country(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '2'
  AND planet_osm_polygon.boundary = 'administrative';

-- State with admin_level 4
-- e.g. England
drop table if exists osm.state;
create table osm.state
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_state on osm.state using gist (geom);
insert into osm.state(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '4'
  AND planet_osm_polygon.boundary = 'administrative';

-- Region admin_level 5
-- e.g. South East
-- This only covers England & Ireland as Wales, Scotland & Northern Ireland have no regions
drop table if exists osm.region;
create table osm.region
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    uppername text,
    geom      geometry(multipolygon, 3857)
);
create index gix_region on osm.region using gist (geom);
--delete from osm.county;
insert into osm.region(osm_id, name, uppername, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name                                        as name,
       upper(planet_osm_polygon.name)                                 AS uppername,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.admin_level = '5'
  AND planet_osm_polygon.boundary = 'administrative';

-- County admin_level 6 or place=county
-- e.g. Kent
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

-- district admin_level 9
-- parish admin_level 10
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
WHERE planet_osm_polygon.admin_level IN ('9', '10')
  AND planet_osm_polygon.boundary = 'administrative';

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
WHERE planet_osm_polygon.amenity IS NOT NULL;

-- ==============================================================================================================
-- Buildings - specifically individual ones like churches, pubs etc

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
-- residential - general land coverage of residential areas

drop table if exists osm.residential;
create table osm.residential
(
    id     serial not null primary key,
    osm_id integer,
    name   text,
    geom   geometry(multipolygon, 3857)
);
create index gix_residential on osm.residential using gist (geom);
insert into osm.residential(osm_id, name, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.landuse = 'residential';

-- ==============================================================================================================
-- forest, parkland

drop table if exists osm.parkland;
create table osm.parkland
(
    id      serial not null primary key,
    osm_id  integer,
    name    text,
    landuse text,
    leisure text,
    geom    geometry(multipolygon, 3857)
);
create index gix_parkland on osm.parkland using gist (geom);
insert into osm.parkland(osm_id, name, landuse, leisure, geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       planet_osm_polygon.landuse,
       planet_osm_polygon.leisure,
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.landuse ILIKE '%grass%'
   or planet_osm_polygon.landuse ILIKE '%moor%'
   or planet_osm_polygon.landuse ILIKE '%park%'
   or planet_osm_polygon.landuse ILIKE '%orchard%'
   or planet_osm_polygon.landuse ILIKE '%vine%'
   or planet_osm_polygon.landuse IN (
                                     'garden', 'Garden',
                                     -- spelling mistakes for grass? seen in the UKIE extract
                                     'gra', 'grasas',
                                     'greenfield',
                                     'meadow', 'meadow;grass',
                                     'plant_nursery', 'plants',
                                     'recreation_ground', 'village_green',
                                     'vineyard'
    )
   OR planet_osm_polygon.leisure ILIKE '%park%'
   -- typo for grass?
   OR planet_osm_polygon.leisure ILIKE '%geass%'
   OR planet_osm_polygon.leisure ILIKE '%grass%'
   OR planet_osm_polygon.leisure IN (
                                     'nature_reserve',
                                     'garden',
                                     'golf_course',
                                     'horse_riding',
                                     'recreation_ground',
                                     'stadium'
    )
   -- Might make these a new recreation layer
   or planet_osm_polygon.leisure ilike '%beer%'
   or planet_osm_polygon.leisure ilike '%picnic%'
   or planet_osm_polygon.leisure ilike '%pitch%'
   or planet_osm_polygon.leisure ilike '%playground%'
   or planet_osm_polygon.leisure ilike '%playing%'
   or planet_osm_polygon.leisure ilike '%pub%gard%'
   or planet_osm_polygon.leisure ilike '%stadium%'
;

drop table if exists osm.forestwoodland;
create table osm.forestwoodland
(
    id        serial not null primary key,
    osm_id    integer,
    name      text,
    landuse   text,
    "natural" text,
    geom      geometry(multipolygon, 3857)
);
create index gix_forestwoodland on osm.forestwoodland using gist (geom);
insert into osm.forestwoodland(osm_id, name, landuse, "natural", geom)
SELECT planet_osm_polygon.osm_id,
       planet_osm_polygon.name,
       planet_osm_polygon.landuse,
       planet_osm_polygon."natural",
       st_multi(planet_osm_polygon.way)::geometry(MultiPolygon, 3857) as way
FROM planet_osm_polygon
WHERE planet_osm_polygon.landuse ilike '%wood%'
   or planet_osm_polygon.landuse ilike '%forest%'
   or planet_osm_polygon."natural" ilike '%wood%'
   or planet_osm_polygon."natural" ilike '%forest%';

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
