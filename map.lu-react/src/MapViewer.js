import React, {Component} from 'react';
import {Map} from 'react-leaflet'
import MapLayer from "./MapLayer";

class MapViewer extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        return <Map
            onMove={() => this.handleMapStateChange()}
            onZoom={() => this.handleMapStateChange()}
            center={map.center}
            ref={(t) => this.mapRef = t}
            zoom={map.zoom}
            zoomControl={false}>
            {
                map.overlays
                    .filter(l => l.visible)
                    .map(l => l.id)
                    .concat(map.baseLayer)
                    .reverse()
                    .map(id => config.layers[id])
                    .filter(l => l)
                    .map(l => <MapLayer key={l.id} layer={l}/>)
            }
        </Map>
    }

    handleMapStateChange(e) {
        // There is a race condition where mapRef can be null
        if (this.mapRef) {
            const app = this.props.app,
                config = app.state,
                map = config.map,
                mc = this.mapRef.leafletElement;
            map.center = mc.getCenter();
            map.zoom = mc.getZoom();
            app.setState(config);
        } else {
            console.log("*** No mapRef ***")
        }
    }
}

export default MapViewer;
