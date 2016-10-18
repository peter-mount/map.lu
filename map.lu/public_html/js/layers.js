/*
 * 
 * The available map layers
 */
var baseLayers = [
    {
        "id": "OL",
        "label": "OSGB Land (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Land/Water",
        "tileLayer": "//map.lu/tiles/osgb15land@EPSG:900913@png/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    },
    {
        "id": "OF",
        "label": "OSGB Full (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Full theme",
        "tileLayer": "//map.lu/tiles/osgb15full@EPSG:900913@png/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    }
];
var overlayLayers = [
    {
        "id": "NR",
        "label": "OSGB Rail (2015)",
        "description": "Ordnance Survey Vector Map District 2015, Railway",
        "tileLayer": "//map.lu/tiles/osgb15rail@EPSG:900913@png/{z}/{x}/{-y}.png",
        "minZoom": 5,
        "maxZoom": 16
    }
];
