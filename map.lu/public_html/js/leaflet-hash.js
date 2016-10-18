/*
 * Our modified version of leaflet hash with picking layers as well as z/x/y
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
