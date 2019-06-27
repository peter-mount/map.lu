import React, {Component} from 'react';
import {Map} from 'react-leaflet'
import {layers} from './Layers'
import MapLayer from "./MapLayer";

class MapViewer extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        let visibleLayers = layers.baseLayers
            .filter(l => l.id === map.baseLayer)
            .reduce((a, l) => {
                a.push(<MapLayer key={l.id} layer={l}/>);
                return a
            }, []);

        visibleLayers = map.overlays
            .filter(l => l.visible)
            .map(l => {
                return layers.overlayLayers
                    .filter(ol => ol.id === l.id)
                    .reduce((a, b) => b)
            })
            .filter(l => l)
            .reduce( (a,l) => {
                a.push(<MapLayer key={l.id} layer={l}/>);
                return a
            },visibleLayers)

        return <Map
            onMove={() => this.handleMapStateChange()}
            onZoom={() => this.handleMapStateChange()}
            center={map.center}
            ref={(t) => this.mapRef = t}
            zoom={map.zoom}
            zoomControl={false}>
            {visibleLayers}
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
