# Layer config

| File | Title |
| :--: | :---: |
| OSVMD | OS Vector Map District |
| OSVMD-Contour | OS Vector Map District + OS Terrain 50 contour lines. Spot heights from OSVMD |

# Commands to add complex layerGroup's to the GeoServer

## Retrieve a layer group config

Here we retrieve the OSVMD layer group from the server:

    curl -v -u 'user:pass' -XGET https://map.lu/geoserver/rest/workspaces/osgb/layergroups/OSVMD.xml >OSVMD.xml

## Create a new layer group

Here we create the OSVMD-Contour layer group:

    curl -v -u 'user:pass' -XPOST -H 'Content-Type: text/xml' -d @OSVMD-Contour.xml https://map.lu/geoserver/rest/workspaces/osgb/layergroups
