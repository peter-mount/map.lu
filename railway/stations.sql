-- Creates a table of all stations in the UK as long,lat pairs
-- used to calculate the tiles needed rendering at high resolution

create table stations
  as with a as (
      select
        p.name,
        st_transform(p.way,4326) as way
      from railway.railway_point p
        join areas a on ST_Intersects(a.way, p.way)
      where a.name='gb' and p.railway like '%station%'
    )
    SELECT name, st_x(way), st_y(way)
      FROM a;
