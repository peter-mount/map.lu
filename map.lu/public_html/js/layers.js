/*
 * 
 * The available map layers
 */
var baseLayers = [
    {
        "id": "OL",
        "label": "OSGB Land (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Land/Water",
        "tileLayer": "//map.lu/tiles/osgb15land/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    },
    {
        "id": "OF",
        "label": "OSGB Full (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Full theme",
        "tileLayer": "//map.lu/tiles/osgb15full/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    },
    {
        "id": "OSM",
        "label": "Open Street Map",
        "description": "Open Street Map",
        "tileLayer": "//map.lu/tiles/osm/{z}/{x}/{y}.png",
        "minZoom": 5,
        "maxZoom": 16
    }
];
var overlayLayers = [
    {
        "id": "NR",
        "label": "OSGB Rail (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Railway",
        "tileLayer": "//map.lu/tiles/osgb15rail/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    }
];
