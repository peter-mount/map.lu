/*
* Map.lu application V2.0
* (C) Peter Mount
*/
var map;

var MapLu = {};

MapLu.layerTypes = {
};

MapLu.createLayer = function (v) {
  return Object.keys(v)
  .reduce(function (a, key) {
    if (MapLu.layerTypes[key])
    return MapLu.layerTypes[key](v[key]);
    return a;
  }, null);
};

MapLu.initMap = function() {
  map = L.map('mapid', {
    //center:,
    attributionControl: false,
    zoomControl: true,
    editable: MapLu.editor ? true : false
  });

  if(MapLu.controls) {
    MapLu.controls( );
  }

  if(MapLu.editor) {
    MapLu.editor( );
  }

  // Move it to our frame
  //$('.leaflet-control-layers form').remove().appendTo($('#map-control-layers'));
  //$('.leaflet-control-layers').remove();

  // URL shortlink
  if( !L.Hash.parseSearch(location.search) && !L.Hash.parseHash(location.hash) ) {
    MapLu.showMap(defaultMap);
  }

  // Add url hash
  new L.hash(map);
}

MapLu.showMap = function (id) {
  map.fitBounds(maps[id]);
};

$(document).ready(function () {
  console.log('init');
  MapLu.initMap();
  console.log('running');
});

console.log('loaded');
