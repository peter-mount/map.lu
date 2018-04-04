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
                    //"tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png"
                    //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png"
                    "tileLayer": "https://s{s}.map.lu/OceanBottom/{z}/{x}/{-y}.png",
                },
                {
                    "tileLayer": "https://s{s}.map.lu/OSM_GBIE_2017/{z}/{x}/{y}.png"
                }
            ],
            "minZoom": 0,
            "maxZoom": 18
        },
        /*
        {
            "id": "OSM",
            "label": "Open Street Map Standard",
            "description": "Open Street Map with detail for British Isles in the standard Mapnik theme",
            "tileLayer": "https://{s}.map.lu/osm/{z}/{x}/{y}.png",
            "minZoom": 0,
            "maxZoom": 18
        },
        */
        {
            "id": "OMP",
            "label": "OS Open Map Local",
            "description": "Ordnance Survey Open Map Local",
            //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgblm%3AOpenMapLocal@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 15,
            "maxZoom": 17
        },
        {
            "id": "OSVMD",
            "label": "OS Vector Map District",
            "description": "Ordnance Survey Vector Map District November 2017",
            //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 15,
            "maxZoom": 16
        },
        {
            "id": "OSVMDC",
            "label": "OS Vector Map District + Contours",
            "description": "Ordnance Survey Vector Map District November 2017 + Terrain 50 Contours",
            //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD-Contour@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb%3AOSVMD-Contour@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 15,
            "maxZoom": 16
        },
        /* development
        {
            "id": "OS2",
            "label": "Open Street Map GeoServer",
            "description": "Open Street Map rendered in GeoServer not Mapnik",
            "layerGroup": [
                //{
                //    "tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png"
                //},
                {
                  "tileLayer": "https://{s}.map.lu/tms/osm:planet_osm_line@EPSG%3A900913@png/{z}/{x}/{-y}.png"
                  //    "tileLayer": "https://{s}.map.lu/land/{z}/{x}/{y}.png"
                }
            ],
            "minZoom": 0,
            "maxZoom": 18
        },
        */
        {
            "id": "WT",
            "label": "World Terrain",
            "description": "Terrain map of the world",
            "tileLayer": "https://s{s}.map.lu/Hypsometric_10m/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3AHypsometric_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NE1",
            "label": "Natural Earth 1",
            "description": "Natural Earth I with Shaded Relief, Water, and Drainages",
            "tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3ANaturalEarth1_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NE2",
            "label": "Natural Earth 2",
            "description": "Natural Earth II with Shaded Relief, Water, and Drainages",
            "tileLayer": "https://s{s}.map.lu/NaturalEarth2_10m/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3ANaturalEarth2_10m@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "OB",
            "label": "Ocean Bottom",
            "description": "Natural Earth Ocean Bottom",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3AOB_LR@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "https://s{s}.map.lu/OceanBottom/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        /* This works but can crash geoserver at low zoom levels. Zoom 16 is best
        {
          "id": "OSGB",
          "label": "District 2016",
          "description": "OSGB District 2016",
          "wms": {
            //"server": "https://map.lu/geoserver/osgb/wms",
            "server": "http://loge.amsterdam.area51.onl/geoserver/osgb/wms",
            "layers": "osgb:District_2016"
          },
          //"tileLayer": "http://loge.amsterdam.area51.onl/tms/osgb:District_2016@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
          "minZoom": 0,
          "maxZoom": 16
      },
      */
      /*
      {
          "id": "CT",
          "label": "UK Contour",
          "description": "OSGB Terra50",
          "wms": {
            //"server": "https://map.lu/truemarble/wms",
            //"server": "https://map.lu/geoserver/TrueMarble/wms",
            "server": "http://loge.amsterdam.area51.onl/geoserver/osgb/wms",
            "layers": "osgb:terra50point"
          },
          "minZoom": 0,
          "maxZoom": 16
      },
      */
      {
          "id": "TM",
          "label": "True Marble",
          "description": "True Marble",
          "wms": {
            "server": "https://map.lu/truemarble/wms",
            //"server": "https://map.lu/geoserver/TrueMarble/wms",
            //"server": "http://loge.amsterdam.area51.onl/geoserver/TrueMarble/wms",
            "layers": "TrueMarble:truemarble"
          },
          "minZoom": 0,
          "maxZoom": 16
      },
        {
            "id": "BKMC2016",
            "label": "Black Marble Colour 2016",
            "description": "NASA Black Marble Colour 2016",
            "wms": {
              "server": "https://map.lu/nasa/wms",
              //"server": "https://map.lu/geoserver/NASA/wms",
              //"server": "http://loge.amsterdam.area51.onl/geoserver/NASA/wms",
              "layers": "NASA:BlackMarble_2016_Colour"
            },
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "BKMC2016G",
            "label": "Black Marble Grey 2016",
            "description": "NASA Black Marble Grey 2016",
            "wms": {
              "server": "https://map.lu/nasa/wms",
              //"server": "https://map.lu/geoserver/NASA/wms",
              //"server": "http://loge.amsterdam.area51.onl/geoserver/NASA/wms",
              "layers": "NASA:BlackMarble_2016_Gray"
            },
            "minZoom": 0,
            "maxZoom": 16
        },
        /* Disabled as broken
        {
            "id": "BMNG",
            "label": "Blue Marble NG",
            "description": "NASA Blue Marble Next Generation",
            "tileLayer": "https://{s}.map.lu/tms/NASA%3ABlueMarbleNG@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "BMNGTB",
            "label": "Blue Marble NG TB",
            "description": "NASA Blue Marble Next Generation with Topography and Bathymetry",
            "tileLayer": "https://{s}.map.lu/tms/NASA%3ABlueMarbleNG-TB@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        */
        /* In development
        {
          "id": "Contour",
          "label": "OSGB Terra50 2016",
          //"group": "OSGB",
          "description": "OSGB Terra50 2016",
          //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
          //"tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
          "tileLayer": "https://geoserver.ganymede.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb:terrain502016@EPSG%3A900913@png/{z}/{x}/{-y}.png",
          "minZoom": 0,
          "maxZoom": 16
        },
        {
            "id": "WBB",
            "label": "TM World Borders Base",
            "group": "Geographic",
            "description": "TM World Borders 0.3",
            "tileLayer": "https://{s}.map.lu/tms/area51%3ATM_WORLD_BORDERS-0.3@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        */
        {
            "id": "NASAVEG",
            "label": "Vegetation cover 2017/09",
            "description": "NASA Vegetation coverage Sept 2017",
            "tileLayer": "https://{s}.map.lu/tms/NASA%3AVegetation_2017_09@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        }
    ],
    groups: {
      "Open Map Local": false,
      "Geographic": false,
      "Rail": false,
      "Real Time": false,
      "Grids": true,
      "UK Railway": false
    },
    overlayLayers: [
      /* development
      {
        "id": "OSGBRail",
        "label": "OSGB UK Railway",
        "group": "OSGB",
        "description": "OSGB UK Railway",
        //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        //"tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "https://geoserver.ganymede.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb:railway2016@EPSG:900913@png/{z}/{x}/{-y}.png",
        "minZoom": 0,
        "maxZoom": 16
      },
      */
      /* Open Map Local */
      {
        "id": "OST50",
        "label": "OS Terrain 50",
        "group": "Open Map Local",
        "description": "Ordnance Survey Terrain 50",
        //"tileLayer": "https://{s}.map.lu/tms/osgb%3AContourLine@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb%3AContourLine@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "minZoom": 15,
        "maxZoom": 16
      },
      {
        "id": "OMW",
        "label": "Open Map Local Water",
        "group": "Open Map Local",
        "description": "Ordnance Survey Open Map Local Water features",
        //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgblm%3AWater@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "minZoom": 15,
        "maxZoom": 17
      },
      {
        "id": "OMRD",
        "label": "UK Roads Open Map Local",
        "group": "Open Map Local",
        "description": "UK Roads Ordnance Survey Open Map Local",
        //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgblm%3ARoads@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "minZoom": 15,
        "maxZoom": 17
      },
      {
        "id": "OMR",
        "label": "UK Railway Open Map Local",
        "group": "Open Map Local",
        "description": "UK Railway Ordnance Survey Open Map Local",
        //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgblm%3ARailway@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "minZoom": 15,
        "maxZoom": 17
      },
      {
        "id": "OMRS",
        "label": "UK Railway Stations",
        "group": "Open Map Local",
        "description": "UK Railway Stations Ordnance Survey Open Map Local",
        //"tileLayer": "https://{s}.map.lu/tms/osgb%3AOSVMD@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osgblm%3Arailwaystation@EPSG%3A900913@png/{z}/{x}/{-y}.png",
        "minZoom": 15,
        "maxZoom": 17
      },
      /* Geographic */
        {
            "id": "OSO",
            "label": "Open Street Map",
            "group": "Geographic",
            "description": "Open Street Map with detail for British Isles in the standard Mapnik theme",
            "tileLayer": "https://s{s}.map.lu/OSM_GBIE_2017/{z}/{x}/{y}.png",
            "minZoom": 0,
            "maxZoom": 18
        },
        {
            "id": "WB",
            "label": "TM World Borders",
            "group": "Geographic",
            "description": "TM World Borders 0.3",
            "tileLayer": "https://s{s}.map.lu/TM_World_Borders_0.3/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/area51%3ATM_WORLD_BORDERS-0.3@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "NEPP",
            "label": "Populated Places",
            "group": "Geographic",
            "description": "Populated Places",
            "tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            //"tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
      {
          "id": "EQ",
          "label": "Earthquake 30 day",
          "group": "Geographic",
          "description": "Earthquakes in last 30 days",
          "tileLayer": "https://{s}.map.lu/tms/area51:v_quake@EPSG%3A900913@png/{z}/{x}/{-y}.png",
          //"tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/area51:v_quake@EPSG%3A900913@png/{z}/{x}/{-y}.png",
          "minZoom": 0,
          "maxZoom": 16
      },
        /*
        {
            "id": "TIPLOC",
            "label": "Rail TIPLOC",
            "group": "Rail",
            "description": "Rail TIPLOC",
            //"tileLayer": "https://{s}.map.lu/geoserver/gwc/service/tms/1.0.0/NaturalEarth%3ANE_PopulatedPlaces@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/rail%3Atiploc@EPSG%3A900913@png/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        */
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
            "tileLayer": "https://s{s}.map.lu/GeographicLines_10m/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_geographic_lines@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "TZ",
            "label": "Time Zones",
            "group": "Geographic",
            "description": "Time Zones",
            "tileLayer": "https://s{s}.map.lu/TimeZones_10m/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_time_zones@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G30",
            "label": "Graticule 30d",
            "group": "Grids",
            "description": "Graticule 30 degree",
            "tileLayer": "https://s{s}.map.lu/Graticule_10m_30d/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_graticules_30@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G20",
            "label": "Graticule 20d",
            "group": "Grids",
            "description": "Graticule 20 degree",
            "tileLayer": "https://s{s}.map.lu/Graticule_10m_20d/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_graticules_20@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G15",
            "label": "Graticule 15 d",
            "group": "Grids",
            "description": "Graticule 15 degree",
            "tileLayer": "https://s{s}.map.lu/Graticule_10m_15d/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_graticules_15@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G10",
            "label": "Graticule 10 d",
            "group": "Grids",
            "description": "Graticule 10 degree",
            "tileLayer": "https://s{s}.map.lu/Graticule_10m_10d/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_graticules_10@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
        },
        {
            "id": "G01",
            "label": "Graticule 1 degree",
            "group": "Grids",
            "description": "Graticule 1 degree",
            "tileLayer": "https://s{s}.map.lu/Graticule_10m_1d/{z}/{x}/{-y}.png",
            //"tileLayer": "https://{s}.map.lu/tms/NaturalEarth%3Ane_10m_graticules_1@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
          },
          {
            "id": "TRNET",
            "label": "Railway Network",
            "group": "UK Railway",
            "description": "Railway network",
            "tileLayer": "https://{s}.map.lu/tms/department_of_transport%3Adepartment_of_transport_railnetworkLine@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
          },
          /* development
          {
            "id": "OSR",
            "label": "OSM Railway Network",
            "group": "UK Railway",
            "description": "OSM Railway network",
            //"tileLayer": "https://{s}.map.lu/tms/osm:osm_railway@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "tileLayer": "http://loge.amsterdam.area51.onl/geoserver/gwc/service/tms/1.0.0/osm:osm_railway@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
          },
          */
          {
            "id": "TRSTN",
            "label": "Railway Stations",
            "group": "UK Railway",
            "description": "Railway stations",
            "tileLayer": "https://{s}.map.lu/tms/department_of_transport%3Adepartment_of_transport_stationsPoint@EPSG%3A900913@jpeg/{z}/{x}/{-y}.png",
            "minZoom": 0,
            "maxZoom": 16
          }
    ]
};
