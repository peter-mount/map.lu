// The basic layer types

// Either XYZ or TMS tile server
MapLu.layerTypes.tileLayer = function (v) {
  return L.tileLayer(v, {
    errorTileUrl: "blank.png"
  });
};

// geoJSON datasource
MapLu.layerTypes.geoJSON = function (v) {
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
};

// Layer group
MapLu.layerTypes.layerGroup = function (v) {
  var l = v.reduce(function (a, b) {
    a.push(MapLu.createLayer(b));
    return a;
  }, []);
  return L.layerGroup(l);
};

// WMS
MapLu.layerTypes.wms = function (v) {
  return L.tileLayer.wms( v.server, {
    layers: v.layers
  } );
};

// gibs
MapLu.layerTypes.gibs = function (v) {
  //var template = "https://map1{s}.vis.earthdata.nasa.gov/wmts-geo/{layer}"+
  //"/default/{time}/{tileMatrixSet}/{z}/{y}/{x}.jpg";
  var template = "https://gibs.earthdata.nasa.gov/wmts/epsg4326/" +
  "{quality}/{layer}/default/{tileMatrixSet}" +
  "/{z}/{y}/{x}.jpeg";

  return L.tileLayer(template, v);
};
