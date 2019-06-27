import React, {Component} from 'react';
import {Map, Marker, Popup, TileLayer} from 'react-leaflet'
import {layers} from './Layers'
import MapLayer from "./MapLayer";

class MapViewer extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        let baseLayer = layers.baseLayers
            .filter(l => l.id === map.baseLayer)
            .reduce((a, l) => l);

        let visibleLayers = [<MapLayer key={baseLayer.id} layer={baseLayer}/>];

        /*
        layers.baseLayers.filter(l => l.id === map.baseLayer).forEach(l => {
            console.log(l.id, l.tileLayer);
            visibleLayers.push(<TileLayer key={l.id} url={l.tileLayer}/>);
        });
         */

        return <Map
            onMove={()=>this.handleMapStateChange()}
            onZoom={()=>this.handleMapStateChange()}
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
