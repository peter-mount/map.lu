/*
 * Map.lu application V2.0
 * (C) Peter Mount
 */
(function (window) {
    var HAS_HASHCHANGE = (function () {
        var doc_mode = window.documentMode;
        return ('onhashchange' in window) && (doc_mode === undefined || doc_mode > 7);
    })();

    L.Hash = function (map) {
        this.onHashChange = L.Util.bind(this.onHashChange, this);
        if (map) {
            this.init(map);
        }
    };

    L.Hash.parseHash = function (hash) {
        if (hash.indexOf('#') === 0) {
            hash = hash.substr(1);
        }
        var args = hash.split("/");
        if (args.length >= 3) {
            var zoom = parseInt(args[0], 10),
                    lat = parseFloat(args[1]),
                    lon = parseFloat(args[2]);
            if (isNaN(zoom) || isNaN(lat) || isNaN(lon)) {
                return false;
            } else {
                var map = this.map;
                $.each(map.meta.baseLayers, function (i, l) {
                    map.removeLayer(l.layer);
                });
                $.each(map.meta.overlayLayers, function (i, l) {
                    map.removeLayer(l.layer);
                });
                $.each(args, function (i, id) {
                    if (i >= 3) {
                        var l = map.xr[id];
                        console.log(i, id, l);
                        if (l)
                            map.addLayer(l);
                    }
                });
                return {
                    center: new L.LatLng(lat, lon),
                    zoom: zoom
                };
            }
        } else {
            return false;
        }
    };

    L.Hash.formatHash = function (map) {
        var center = map.getCenter(),
                zoom = map.getZoom(),
                precision = Math.max(0, Math.ceil(Math.log(zoom) / Math.LN2));

        var o = [zoom,
            center.lat.toFixed(precision),
            center.lng.toFixed(precision)
        ];
        map.eachLayer(function (l) {
            if (l.meta && l.meta.id)
                o.push(l.meta.id);
        });
        return "#" + o.join("/");
    };
    L.Hash.prototype = {
        map: null,
        lastHash: null,
        parseHash: L.Hash.parseHash,
        formatHash: L.Hash.formatHash,
        init: function (map) {
            this.map = map;

            // reset the hash
            this.lastHash = null;
            this.onHashChange();

            if (!this.isListening) {
                this.startListening();
            }
        },
        removeFrom: function (map) {
            if (this.changeTimeout) {
                clearTimeout(this.changeTimeout);
            }

            if (this.isListening) {
                this.stopListening();
            }

            this.map = null;
        },
        onMapMove: function () {
            // bail if we're moving the map (updating from a hash),
            // or if the map is not yet loaded

            if (this.movingMap || !this.map._loaded) {
                return false;
            }

            var hash = this.formatHash(this.map);
            if (this.lastHash !== hash) {
                location.replace(hash);
                this.lastHash = hash;
            }
        },
        movingMap: false,
        update: function () {
            var hash = location.hash;
            if (hash === this.lastHash) {
                return;
            }
            var parsed = this.parseHash(hash);
            if (parsed) {
                this.movingMap = true;

                this.map.setView(parsed.center, parsed.zoom);

                this.movingMap = false;
            } else {
                this.onMapMove(this.map);
            }
        },
        // defer hash change updates every 100ms
        changeDefer: 100,
        changeTimeout: null,
        onHashChange: function () {
            // throttle calls to update() so that they only happen every
            // `changeDefer` ms
            if (!this.changeTimeout) {
                var that = this;
                this.changeTimeout = setTimeout(function () {
                    that.update();
                    that.changeTimeout = null;
                }, this.changeDefer);
            }
        },
        isListening: false,
        hashChangeInterval: null,
        startListening: function () {
            this.map.on("moveend", this.onMapMove, this);

            this.map.on("baselayerchange", this.onMapMove, this);
            this.map.on("overlayadd", this.onMapMove, this);
            this.map.on("overlayremove", this.onMapMove, this);
            this.map.on("layeradd", this.onMapMove, this);
            this.map.on("layerremove", this.onMapMove, this);

            if (HAS_HASHCHANGE) {
                L.DomEvent.addListener(window, "hashchange", this.onHashChange);
            } else {
                clearInterval(this.hashChangeInterval);
                this.hashChangeInterval = setInterval(this.onHashChange, 50);
            }
            this.isListening = true;
        },
        stopListening: function () {
            this.map.off("moveend", this.onMapMove, this);

            if (HAS_HASHCHANGE) {
                L.DomEvent.removeListener(window, "hashchange", this.onHashChange);
            } else {
                clearInterval(this.hashChangeInterval);
            }
            this.isListening = false;
        }
    };
    L.hash = function (map) {
        return new L.Hash(map);
    };
    L.Map.prototype.addHash = function () {
        this._hash = L.hash(this);
    };
    L.Map.prototype.removeHash = function () {
        this._hash.removeFrom();
    };
})(window);

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

var maps = {
    "uk": [[61, 2], [50, -9]],
    "england": [[55, 2], [50, -6]],
    "england-se": [[52.5, 2], [50.5, -1]],
    "england-sw": [[52.5, -1], [50, -6]],
    "scotland": [[59, -1.5], [55.5, -8]],
    "wales": [[53.5, -2], [51.5, -5.5]],
    "london": [[51.75,0.5],[51.25,-0.5]]
};

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
        "baseLayers": [
            {
                "id": "OF",
                "label": "OSGB Full (2015)",
                "description": "Ordnance Survey Vector Map District 2015, Full theme",
                "tileLayer": "tiles/osgb2015/full/{z}/{x}/{-y}.png",
                "minZoom": 5,
                "maxZoom": 16
            }
        ],
        "overlayLayers": []
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
        location.hash = "#15/51.505/-0.09/OF";

    var hash = new L.hash(map);
    //map.setView([51.505, -0.09], 15);
    console.log(window.location.hash);

});
