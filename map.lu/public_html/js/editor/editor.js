var drawnItems;

MapLu.editor = function () {
  drawnItems = L.featureGroup().addTo(map)
  
  map.addControl(new L.Control.Draw({
      edit: {
          featureGroup: drawnItems,
          poly: {
              allowIntersection: false
          }
      },
      draw: {
          polygon: {
              allowIntersection: false,
              showArea: true
          }
      }
  }));

  map.on(L.Draw.Event.CREATED, function (event) {
      var layer = event.layer;

      drawnItems.addLayer(layer);
  });
}
