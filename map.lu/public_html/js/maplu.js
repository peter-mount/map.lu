/*
 * Map.lu application V2.0
 * (C) Peter Mount
 */
var map;

function showAbout() {
    $("#about").modal();
}

function showCopyright() {
    $("#copyright").modal();
}

function showReuse() {
    $("#reuse").modal();
}

function showMap(id) {
    map.fitBounds(maps[id]);
}

$(document).ready(function () {
    map = L.map('mapid', {
        //center:,
        attributionControl: false,
        zoomControl: true
    });
    // Map scale
    L.control.scale({metric: true, imperial: true}).addTo(map);

    // Attribution
    L.control.attribution({
        "prefix": "Map imagery ©2012-2016 Peter Mount, <a onclick=\"showCopyright();\">more information</a>"
    }).addTo(map);

    var ctrl = L.control.layers().addTo(map);
    //$.get("layers.json", function (d) {
    map.meta = {
        "baseLayers": baseLayers,
        "overlayLayers": overlayLayers
    };
    map.xr = {};

    // Add base layers
    $.each(map.meta.baseLayers, function (i, v) {
        v.layer = L.tileLayer(v.tileLayer, {
            errorTileUrl: "error.png"
        });
        v.layer.meta = v;
        map.xr[v.id] = v.layer;
        ctrl.addBaseLayer(v.layer, v.label);
        // Activate first base layer
        if (i === 0)
            map.meta.baseLayers[0].layer.addTo(map);
    });

    // Add overlay layers
    $.each(map.meta.overlayLayers, function (i, v) {
        v.layer = L.tileLayer(v.tileLayer, {
            errorTileUrl: "blank.png"
        });
        v.layer.meta = v;
        map.xr[v.id] = v.layer;
        ctrl.addOverlay(v.layer, v.label);
    });

    // URL shortlink
    console.log(location.hash);
    if (!location.hash || location.hash === '#')
        showMap(defaultMap);
    //location.hash = "#15/51.505/-0.09/OF";

    var hash = new L.hash(map);
    //map.setView([51.505, -0.09], 15);
    console.log(window.location.hash);

});
