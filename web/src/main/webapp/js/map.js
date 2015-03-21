// Version 2 of the map.lu map browser

function getLayer(n) {
    var l = map.getLayersByName(n);
    return l.length === 1 ? l[0] : undefined;
}

function addLayers(comp, pre, visible, base, defs) {
    jQuery.each(defs, function (i, v) {
        addLayerComponent(comp, pre, i, v.name, v, visible, base, v.background);
    });
}
/**
 * Adds DOM and Event's to the page for a layer
 * @param {type} comp UL component to add
 * @param {type} pre prefix making ul unique, eg "obs" "fore", "base" etc
 * @param {type} name Layer name
 * @param {type} display Display name
 * @param {type} layer Layer to add
 * @param {type} visible is layer visible, ignored if base===true
 * @param {type} base is base layer
 * @returns {undefined}
 */
function addLayerComponent(comp, pre, name, display, layer, visible, base, background) {
    var id = 'layer-' + pre + '-' + name;
    if (base) {
        map.addLayer(layer);
        comp.append('<li><input id="' + id + '" type="radio" name="base" value="' + layer.name + '"/>' + display + '</li>');
        $('#' + id).change(function () {
            var l = getLayer($(this).val());
            if (l !== undefined) {
                map.setBaseLayer(l);
                $('#map').css({
                    background: background ? background : '#fff'
                });
            }
            else
                console.error("Unable to set base layer ", $(this).val());
        });
    } else {
        comp.append('<li><input id="' + id + '" type="checkbox" name="' + name + '" value="' + layer.name + '"/>' + display + '</li>');
        setTimeout(function () {
            layer.setVisibility(visible);
            if (visible)
                $('#' + id).attr('checked', 'checked');
        }, 500);
        map.addLayer(layer);
        $('#' + id).change(function () {
            var l = getLayer($(this).val());
            if (l !== undefined)
                l.setVisibility($(this).is(':checked'));
            else
                console.error("Unable to set layer ", $(this).attr('name'));
        });
    }
}

function newOSMapLayer(layer, name, base, background) {
    return new OpenLayers.Layer.GeoWebCache(
            {
                url: "/tiles/geos/",
                name: name,
                gridSetId: layer,// + '@EPSG:900913@png',
                type: 'png',
                // OSGB Standard stylesheets are limited to 17 although 19 would be nice
                numZoomLevels: 17,
                isBaseLayer: base
            },
    background
            );
}

var map;
function showMap() {
    var graticuleControl = new OpenLayers.Control.Graticule();
    map = new OpenLayers.Map({
        div: "map",
        projection: new OpenLayers.Projection("EPSG:900913"),
        displayProjection: new OpenLayers.Projection("EPSG:4326"),
        layers: [],
        controls: [
            new OpenLayers.Control.KeyboardDefaults(),
            graticuleControl,
            new OpenLayers.Control.Navigation(),
            //new OpenLayers.Control.Permalink({anchor: true}), // to change page url as you pan/zoom?
            //new OpenLayers.Control.MousePosition(),
            //new OpenLayers.Control.OverviewMap(),
            new OpenLayers.Control.ScaleLine({div: document.getElementById('map-zoom-scale')})
        ]});

    // Base Layers
    var baseLayers = {
        osgb: newOSMapLayer('osgb', 'OS Vector District', true, '#0099FF'),
        osgbland: newOSMapLayer('landcover', 'OSGB Land Cover', true, '#0099FF'),
        osgbdark: newOSMapLayer('rail_dark', 'UK Railway Dark', true, '#0099FF'),
        osm: new OpenLayers.Layer.MapLu('Open Street Map', 'osm', true),
        land: new OpenLayers.Layer.MapLu('OSM Land Cover', 'land', true)
    };
    addLayers($('#map-base-layers ul'), 'base', true, true, baseLayers);

    // Default with the OSGB layer. OSM does not need the CSS setting
    $('#layer-base-osgb').prop('checked', true);
    map.setBaseLayer(baseLayers.osgb);
    $('#map').css({
        background: baseLayers.osgb.background
    });

    // Overlay Layers
    addLayers($('#map-aux-layers ul'), 'aux', false, false, {
        graticule: graticuleControl.gratLayer
    });
    addLayers($('#map-osm-layers ul'), 'osm', false, false, {
//        mainline: new OpenLayers.Layer.MapLu('Mainline', 'mainline', false),
//        hs2: new OpenLayers.Layer.MapLu('HS2', 'hs2', false),
//        //abandoned: new OpenLayers.Layer.MapLu('Abandoned lines', 'abandoned', false),
//        disused: new OpenLayers.Layer.MapLu('Disused lines', 'disused', false),
//        motorway: new OpenLayers.Layer.MapLu('Motorways', 'motorway', false)
    });
    addLayers($('#map-osgb-layers ul'), 'osgb', false, false, {
        osgb_building: newOSMapLayer('osgb:building', 'OSGB Buildings', false),
        osgb_road: newOSMapLayer('osgb_road', 'OSGB Road', false),
        osgb_rail: newOSMapLayer('osgb_rail', 'OSGB Railway', false)
    });

    //Center the Map over the UK
    // UK: -3.5, 54.5 zoom 5
    // Maidstone: 0.529579, 51.271749 zoom 9
    map.setCenter(new OpenLayers.LonLat(-3.5, 54.5).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject()), 6);
}

// Prevent pink tiles
OpenLayers.Util.onImageLoadError = function () {
    this.src = "/blank.png";
    this.style.display = "";
};

// The Map preset zoom control
var map_presets = {
    kent: [0.77952, 51.22017, 9, "Kent"],
    london: [-0.1447, 51.46466, 9, "London"],
    southeast: [0.56494, 51.47245, 8, "Southeast England"],
    southwest: [-3.0166, 50.74824, 7, "Southwest England"],
    uk: [-3.5, 54.5, 5, "UK"],
    england: [-2.30249, 53.06891, 6, "England"],
    scotland: [-5.30176, 57.57004, 6, "Scotland"],
    wales: [-3.82959, 52.39367, 7, "Wales"],
    nire: [-6.82336, 54.64647, 8, 'Northern Ireland'],
    ire: [-7.81763, 53.58073, 6, "Ireland"]
};
function setPreset(name) {
    map.setCenter(new OpenLayers.LonLat(map_presets[name][0], map_presets[name][1]).transform(new OpenLayers.Projection("EPSG:4326"), map.getProjectionObject()), map_presets[name][2]);
}
function mapPresets() {
    var select = $('<select id="map-presets-select" title="Select an area to automatically zoom the map"></select>').
            appendTo($('#map-presets')).
            append('<option value="">Zoom to</option>').
            change(function () {
                var v = $('#map-presets select').val();
                $('#map-presets select').val('');
                setPreset(v);
            });
    jQuery.each(map_presets, function (i, v) {
        select.append('<option value="' + i + '">' + v[3] + '</option>');
    });
}

function mapControls() {
    // Map Zoom control
    $('#map-zoom-level').append('<img id="map-zoom-level-out" src="/images/nav/Back24.gif" title="Zoom the map out"/>');
    $('#map-zoom-level-out').bind('click', function () {
        map.zoomOut();
    });
    $('#map-zoom-level').append('<input id="map-zoom-level-slide" type="range" min="0" max="18" step="1" keyboard="false" title="Zoom in or out of the map"/>');
    $('#map-zoom-level-slide').val(map.getZoom());
    $('#map-zoom-level-slide').attr('min', map.getMinZoom());
    $('#map-zoom-level-slide').attr('max', Math.max(17, map.getNumZoomLevels() - map.getMinZoom() + 1));
    $('#map-zoom-level-slide').change(function () {
        map.setCenter(map.getCenter(), $('#map-zoom-level-slide').val());
    });
    map.events.register("move", $('#map-zoom-level-slide'), function () {
        $('#map-zoom-level-slide').val(map.getZoom());
    });
    $('#map-zoom-level').append('<img id="map-zoom-level-in" src="/images/nav/Forward24.gif" title="Zoom the map in"/>');
    $('#map-zoom-level-in').bind('click', function () {
        map.zoomIn();
    });
    $('#map-aux-layers ul').append($('<button>Scale</button>').click(function () {
        console.log('Scale', map.getScale(), 'Zoom', map.getZoom(), map.getUnits()
                );
    }));
}
/*
 * Zoom 6 6933486.650500195
 *  Scale 6933486.650500195 Zoom 6
 map.js:170 Scale 3466743.3252500976 Zoom 7
 2
 map.js:170 Scale 1733371.6626250488 Zoom 8
 */
$(document).ready(function () {
//    var h = screen.height;
//    $('#map-outer').css({
//        height: h + 'px'
//    });
    showMap();
    mapPresets();
    mapControls();
    //setPreset('uk');
});
