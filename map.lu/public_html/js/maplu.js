/*
 * Map.lu application V2.0
 * (C) Peter Mount
 */
var MapLu = (function () {
    var map;

    function MapLu() {}

    $(document).ready(function () {
        initMap();
    });

    MapLu.layerTypes = {
        // Either XYZ or TMS tile server
        tileLayer: function (v) {
            return L.tileLayer(v, {
                errorTileUrl: "blank.png"
            });
        },
        // geoJSON datasource
        geoJSON: function (v) {
            // FIXME this is specific to earthQuake
            function onEachFeature(feature, layer) {
                var popupContent = "<p>Mag " + feature.properties.mag + " " + feature.properties.place + "</p>"
                        + "<p>" + new Date(feature.properties.time) + "</p>";

                if (feature.properties && feature.properties.popupContent) {
                    popupContent += feature.properties.popupContent;
                }

                layer.bindPopup(popupContent);
            }
            function pointToLayer(feature, latlng) {
                return L.circleMarker(latlng, {
                    radius: 1.5 * feature.properties.mag, //8,
                    fillColor: "#ff7800",
                    color: "#000",
                    weight: 1,
                    opacity: 1,
                    fillOpacity: 0.8
                });
            }

            var ret = L.geoJSON([], {
                style: function (feature) {
                    return feature.properties && feature.properties.style;
                },
                onEachFeature: onEachFeature,
                pointToLayer: pointToLayer
            });
            $.ajax({
                url: v,
                success: function (layer) {
                    ret.addData(layer);
                }
            });

            return ret;
        },
        // Layer group
        layerGroup: function (v) {
            console.log(v);
            var l = v.reduce(function (a, b) {
                console.log(b);
                a.push(MapLu.createLayer(b));
                return a;
            }, []);
            console.log(l);
            return L.layerGroup(l);
        }
    };

    MapLu.createLayer = function (v) {
        return Object.keys(v)
                .reduce(function (a, key) {
                    if (MapLu.layerTypes[key])
                        return MapLu.layerTypes[key](v[key]);
                    return a;
                }, null);
    };

    function initMap() {
        map = L.map('mapid', {
            //center:,
            attributionControl: false,
            zoomControl: true
        });

        // Map scale
        L.control
                .scale({metric: true, imperial: true})
                .addTo(map);

        // Attribution
        var year = new Date().getYear() + 1900;
        $('.copyYear').empty().append(year);
        L.control.attribution({
            "prefix": "Map imagery ©2012-" + year + " Peter Mount, map.lu &amp; others: <a href=\"/about/\">more information</a>"
        }).addTo(map);

        //var ctrl = L.control.layers().addTo(map);
        //$.get("layers.json", function (d) {
        map.meta = layers;
        map.xr = {};

        var baseLayers = {}, overlays = {}, options = {
            // Declare groups that are to be exclusive (use radio inputs)
            exclusiveGroups: Object.keys(layers.groups).reduce(function (a, b) {
                if (layers.groups[b])
                    a.push(b);
                return a;
            }, []),
            // Show a checkbox next to non-exclusive group labels for toggling all
            groupCheckboxes: false
        };

        // Add base layers
        $.each(layers.baseLayers, function (i, v) {
            v.layer = MapLu.createLayer(v);
            v.layer.meta = v;
            if (v.id)
                map.xr[v.id] = v.layer;
            baseLayers[v.label] = v.layer;

            // Activate first base layer
            if (i === 0)
                v.layer.addTo(map);
        });

        // Add overlay layers
        $.each(layers.overlayLayers, function (i, v) {
            // Ensure the groups exist
            if (!v.group)
                v.group = "Undefined";
            if (!overlays[v.group])
                overlays[v.group] = {};

            // Create the layer
            v.layer = MapLu.createLayer(v);
            v.layer.meta = v;
            if (v.id)
                map.xr[v.id] = v.layer;
            overlays[v.group][v.label] = v.layer;
        });

        // Add the control
        ctrl = L.control.groupedLayers(baseLayers, overlays, options).addTo(map);
        // Move it to our frame
        $('.leaflet-control-layers form').remove().appendTo($('#map-control-layers'));
        $('.leaflet-control-layers').remove();

        // URL shortlink
        if (!location.hash || location.hash === '#')
            MapLu.showMap(defaultMap);

        // Add url hash
        new L.hash(map);
    }

    MapLu.showMap = function (id) {
        map.fitBounds(maps[id]);
    };

    return MapLu;
})();
