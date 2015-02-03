// Version 1 of the OTM Map Browser

function moveElement(from, to) {
    var src = document.querySelector(from);
    src.parentNode.removeChild(src);
    document.getElementById(to).appendChild(src);
}

function showMap() {
    var map = new OpenLayers.Map('map');

    // Base Layers
    var land = new OpenLayers.Layer.MapLu('Land Cover', 'land', true);
    var osm = new OpenLayers.Layer.MapLu('Street Map', 'osm', true);
    map.addLayer(osm);

    // Overlay Layers
    var mainline = new OpenLayers.Layer.MapLu('Mainline', 'mainline', false);
    map.addLayer(mainline);
    var hs2 = new OpenLayers.Layer.MapLu('HS2', 'hs2', false);
    var abandoned = new OpenLayers.Layer.MapLu('Abandoned lines', 'abandoned', false);
    var disused = new OpenLayers.Layer.MapLu('Disused lines', 'disused', false);
    var abandoned = new OpenLayers.Layer.MapLu('Motorways', 'motorway', false);

    // MODP Layers
//    var radarLayer = new OpenLayers.Layer.MODP('Rain Radar', 'rain', map);
//    map.addLayer(radarLayer);
//    var lightningLayer = new OpenLayers.Layer.MODP('Lightning', 'lightning', map);
//    map.addLayer(lightningLayer);

    //Center the Map over the UK
    // UK: -3.5, 54.5 zoom 5
    // Maidstone: 0.529579, 51.271749 zoom 9
    map.setCenter(
            new OpenLayers.LonLat(-3.5, 54.5).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject()),
            6
            );

    // Layout hacks, so we don't have the controls inside the map, these
    // move the various controls into the left control panel
    //moveElement("#map .leaflet-control-zoom", "map-zoom-control");
    //moveElement("#map .leaflet-control-scale", "map-zoom-scale");
    //moveElement("#map .leaflet-control-layers", "map-layers");
}

$(document).ready(function () {
//    var h = screen.height;
//    $('#map-outer').css({
//        height: h + 'px'
//    });
    showMap();
});
