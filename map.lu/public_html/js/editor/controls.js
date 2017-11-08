
MapLu.controls = function( ) {

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
}
