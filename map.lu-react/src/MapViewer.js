import React, {Component} from 'react';
import {Map, Marker, Popup, TileLayer, ZoomControl} from 'react-leaflet'

class MapViewer extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        return <Map
            center={map.center}
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
            <ZoomControl position="topright"/>
        </Map>
    }
}

export default MapViewer;
