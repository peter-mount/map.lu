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
            var l = v.reduce(function (a, b) {
                a.push(MapLu.createLayer(b));
                return a;
            }, []);
            return L.layerGroup(l);
        },
        // WMS
        wms: function (v) {
          return L.tileLayer.wms( v.server, v );
        },
        // gibs
        gibs: function (v) {
          //var template = "https://map1{s}.vis.earthdata.nasa.gov/wmts-geo/{layer}"+
          //"/default/{time}/{tileMatrixSet}/{z}/{y}/{x}.jpg";
          var template = "https://gibs.earthdata.nasa.gov/wmts/epsg4326/" +
          "{quality}/{layer}/default/{tileMatrixSet}" +
          "/{z}/{y}/{x}.jpeg";

          return L.tileLayer(template, v);
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
            "prefix": "Map imagery ©2012-" + year + " Peter Mount, map.lu &amp; others: <a href=\"/about/index.html\">more information</a>"
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
        /*

        // The base layers
        $('.leaflet-control-layers .leaflet-control-layers-base')
          //.remove()
          .appendTo($('#collapse0 .card-body'));

        // Now our groups
        var accordion = $('#accordion');
        for( var i=1; $('#leaflet-control-layers-group-'+i).length > 0; i++) {
          console.log( 'Group', i );
          var src = $('#leaflet-control-layers-group-'+i);//.remove();
          var title = src.find('.leaflet-control-layers-group-name').text()
          src.find('label.leaflet-control-layers-group-label').remove();
          var selectors = src.find('label');//.remove();

          var e = $('<div></div>')
            .appendTo(accordion)
            .addClass('card')
            .append(
              $('<div></div>')
                .attr( {
                  class: 'card-header',
                  role:'tab',
                  id: 'heading' + i
                } )
                .append(
                  $('<h3></h3>')
                    .addClass('mb-0')
                    .append(
                      $('<a></a>')
                        .attr( {
                          id: 'heading' + 1,
                          class: 'collapsed',
                          'data-toggle': 'collapse',
                          href: '#collapse' + i,
                          'aria-expanded': false,
                          'aria-controls': "collapse" + i,
                          'data-parent': '#accordion'
                        })
                        .text( title )
                    )
                )
            )
            .append(
              $('<div></div>')
                .attr( {
                  id: 'collapse' + i,
                  class: 'collapse',
                  role: 'tabpanel',
                  'aria-labelledby': 'heading' + i,
                  'data-parent': '#accordion'
                } )
                .append(
                  $('<div></div>')
                    .addClass('card-body')
                    .append( selectors )
                )
            )
        }

        //$('.leaflet-control-layers form').remove().appendTo($('#map-control-layers'));
        $('.leaflet-control-layers').remove();
        */

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

    return MapLu;
})();
