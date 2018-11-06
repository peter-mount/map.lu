create table if not exist areas (
  name name,
  -- The geometry
  geom geometry(Geometry,4326),
  -- The way, geom converted to OSM coordinate system
  way geometry(Geometry,3857),
  primary key (name)
);

insert into areas (name, geom) values (
  "gb",
  ST_MakePolygon(ST_GeomFromText('LINESTRING( 1.983960E+00   5.133770E+01, 5.807600E-02   5.010375E+01, -1.246112E+00   4.989032E+01, -2.027284E+00   4.977612E+01, -2.020900E+00   4.976352E+01, -2.031990E+00   4.976171E+01, -1.808598E+00   4.910263E+01, -1.835368E+00   4.900443E+01, -3.940324E+00   4.915592E+01, -7.024780E+00   4.970097E+01, -5.441616E+00   5.278017E+01, -5.206178E+00   5.377268E+01, -5.488813E+00   5.486510E+01, -6.208707E+00   5.533747E+01, -6.604158E+00   5.543057E+01, -7.148041E+00   5.566455E+01, -1.486751E+01   5.746894E+01, -1.499070E+01   5.768017E+01, -1.208287E+01   5.853333E+01, -1.637515E+00   6.113564E+01, -2.670263E-01   6.110300E+01, 1.278458E-01   5.976591E+01, 9.781600E-02   5.942198E+01, 7.998970E-01   5.579959E+01, 1.702395E+00   5.443427E+01, 2.250000E+00   5.258000E+01, 1.983960E+00   5.133770E+01)'));
);

-- Update areas to osm
update areas set way = st_transform( geom, 3857);
