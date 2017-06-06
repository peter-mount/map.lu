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
            "prefix": "Map imagery ©2012-" + year + " Peter Mount, map.lu &amp; others: <a href=\"../copyright/\">more information</a>"
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
            v.layer = L.tileLayer(v.tileLayer, {
                errorTileUrl: "blank.png"
            });
            v.layer.meta = v;
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

            if (v.tileLayer) {
                console.log('tile', v.tileLayer);
                v.layer = L.tileLayer(v.tileLayer, {
                    errorTileUrl: "blank.png"
                });
            } else if (v.geoJSON) {
                console.log('geoj', v.geoJSON);
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

                v.layer = L.geoJSON([], {
                    style: function (feature) {
                        return feature.properties && feature.properties.style;
                    },
                    onEachFeature: onEachFeature,
                    pointToLayer: pointToLayer
                });
                $.ajax({
                    url: v.geoJSON,
                    success: function (layer) {
                        v.layer.addData(layer);
                    }
                });
            }

            v.layer.meta = v;
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
            showMap(defaultMap);

        // Add url hash
        new L.hash(map);
    }
 
    MapLu.showMap = function (id) {
        map.fitBounds(maps[id]);
    }

    return MapLu;
})();
