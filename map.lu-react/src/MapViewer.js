import React, {Component} from 'react';
import {Map, Marker, Popup, TileLayer} from 'react-leaflet'

class MapViewer extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log("View", map.center, map.zoom);
        return <Map
            onMove={this.handleMapStateChange}
            onZoom={this.handleMapStateChange}
            center={map.center}
            ref={(t) => this.mapRef = t}
            zoom={map.zoom}
            zoomControl={false}>
            <TileLayer
                url="https://sa.map.lu/osm201810/{z}/{x}/{y}.png"
                // url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                attribution="&copy; <a href=&quot;http://osm.org/copyright&quot;>OpenStreetMap</a> contributors"
            />
            <Marker position={map.center}>
                <Popup>A pretty CSS3 popup.<br/>Easily customizable.</Popup>
            </Marker>
        </Map>
    }

    handleMapStateChange = (e) => {
        const app = this.props.app,
            config = app.state,
            map = config.map,
            mc = this.mapRef.leafletElement;
        map.center = mc.getCenter();
        map.zoom = mc.getZoom();
        app.setState(config);
    }
}

export default MapViewer;
