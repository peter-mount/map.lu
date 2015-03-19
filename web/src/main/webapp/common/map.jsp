<%-- 
    Document   : home
    Created on : 21-Jan-2015, 15:10:15
    Author     : peter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="map-menu">
    <div class="map-pane">
        <div id="map-zoom-control"></div>
        <div id="map-zoom-info" >
            <div id="map-zoom-level" ></div>
            <div id="map-presets"></div>
            <div id="map-zoom-scale" ></div>
            <div id="map-zoom-pos" ></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="leaflet-control-layers-separator"></div>
    <div class="map-pane">
        <div id="map-base-layers">
            <h3>Base Layers</h3>
            <ul></ul>
        </div>
        <div id="map-osm-layers">
            <h3>OSM Layers</h3>
            <ul></ul>
        </div>
        <div id="map-osgb-layers">
            <h3>OSGB Layers</h3>
            <ul></ul>
        </div>
        <div id="map-aux-layers">
            <h3>Other Overlays</h3>
            <ul></ul>
        </div>
    </div>
    <div class="leaflet-control-layers-separator"></div>
</div>
<div class="leaflet-control-layers-separator"></div>
</div>
<div id="map"></div>
