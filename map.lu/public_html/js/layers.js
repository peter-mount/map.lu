/*
 * 
 * The available map layers
 */
var layers = {
    baseLayers: [
        {
            "id": "OS",
            "label": "Open Street Map Ocean",
            "description": "Composite of Ocean Bottom and Open Street Map layers",
            "layerGroup": [
                {
                    "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png"
                },
                {
                    "tileLayer": "https://{s}.map.lu/land/{z}/{x}/{y}.png"
                }
            ],
            "minZoom": 0,
            "maxZoom": 18
        },
        {
            "id": "OSM",
            "label": "Open Street Map Standard",
            "description": "Open Street Map with detail for British Isles in the standard Mapnik theme",
            "tileLayer": "https://{s}.map.lu/osm/{z}/{x}/{y}.png",
            "minZoom": 0,
            "maxZoom": 18
        },
        {
            "id": "WT",
            "label": "World Terrain",
            "description": "Terrain map of the world",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3AHypsometric_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NE1",
            "label": "Natural Earth 1",
            "description": "Natural Earth I with Shaded Relief, Water, and Drainages",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANaturalEarth1_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NE2",
            "label": "Natural Earth 2",
            "description": "Natural Earth II with Shaded Relief, Water, and Drainages",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANaturalEarth2_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "OB",
            "label": "Ocean Bottom",
            "description": "Natural Earth Ocean Bottom",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        }
    ],
    groups: {
        "Geographic": false,
        "Real Time": false,
        "Grids": true,
    },
    overlayLayers: [
        {
            "id": "OSO",
            "label": "Open Street Map",
            "group": "Geographic",
            "description": "Open Street Map with detail for British Isles in the standard Mapnik theme",
            "tileLayer": "https://{s}.map.lu/land/{z}/{x}/{y}.png",
            "minZoom": 0,
            "maxZoom": 18
        },
        {
            "id": "WB",
            "label": "TM World Borders",
            "group": "Geographic",
            "description": "TM World Borders 0.3",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/area51%3ATM_WORLD_BORDERS-0.3@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NEPP",
            "label": "Populated Places",
            "group": "Geographic",
            "description": "Populated Places",
            //"tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "https:loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        /*
         {
         "id": "EQ",
         "label": "Recent Earthquakes",
         "greoup": "Real Time",
         "description": "Recent earthquakes (USGS)",
         "geoJSON": "http://api.area51.onl/earthquake/significant.geojson",
         //"geoJSON": "http://api.area51.onl/fdsnws/event/1/query?format=geojson&starttime=2016-11-08&endtime=2016-11-14",
         "minZoom": 0,
         "maxZoom": 16
         },
         */
        // Blank layer to allow disabling of lines
        {
            "label": "None",
            "group": "Grids",
            "description": "No grids",
            // See https://stackoverflow.com/a/28094977
            "tileLayer": "",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "GL",
            "label": "Geographic Lines",
            "group": "Grids",
            "description": "Geographic Lines",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_geographic_lines@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "TZ",
            "label": "Time Zones",
            "group": "Geographic",
            "description": "Time Zones",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_time_zones@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G30",
            "label": "Graticule 30d",
            "group": "Grids",
            "description": "Graticule 1 degree",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_graticules_30@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G20",
            "label": "Graticule 20d",
            "group": "Grids",
            "description": "Graticule 20 degree",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_graticules_20@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G15",
            "label": "Graticule 15 d",
            "group": "Grids",
            "description": "Graticule 15 degree",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_graticules_15@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G10",
            "label": "Graticule 10 d",
            "group": "Grids",
            "description": "Graticule 1degree",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_graticules_10@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G01",
            "label": "Graticule 1 d",
            "group": "Grids",
            "description": "Graticule 1 degree",
            "tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3Ane_10m_graticules_1@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        }
    ]
};
