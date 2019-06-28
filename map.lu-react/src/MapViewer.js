import React, {Component} from 'react';
import {Map} from 'react-leaflet'
import MapLayer from "./MapLayer";

class MapViewer extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        // lastRender is the time as a number of when we last rendered. If it's false or forceRefresh is set it gets
        // reset to the current time.
        //
        // We use this with the index within the final layer list so that each layer gets a unique key so that when
        // the layers are modified (e.g. new baselayer or an overlay is added or reordered) then the final layer order
        // within leaflet is correct.
        //
        // This goes against React reusing components that haven't changed but we have to do this to enforce the layer
        // ordering within leaflet.
        // An example of this is changing the base layer. Doing it react style using the unique layer id as the key
        // causes the existing layers to remain and the base layer being added to the end of the list. Visually this causes
        // the new baselayer to appear over all other layers instead of at the bottom.
        //
        // This only happens here because leaflet manages the final DOM for the map not React as react-leaflet is only
        // a wrapper.
        let lastRender = map.lastRender
        if (!lastRender || map.forceRefresh) {
            lastRender = new Date().getTime();
            map.lastRender = lastRender;
            map.forceRefresh = false
        }

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
                    .map((l, i) => <MapLayer key={i + lastRender} layer={l}/>)
            }
        </Map>
    }

    handleMapStateChange(e) {
        // There is a race condition where mapRef can be null
        if (this.mapRef) {
            const app = this.props.app,
                config = app.state,
                map = config.map,
                mc = this.mapRef.leafletElement,
                ctr = mc.getCenter();
            map.center = [ctr.lat, ctr.lng];
            map.zoom = mc.getZoom();
            app.setState(config);
        } else {
            console.log("*** No mapRef ***")
        }
    }
}

export default MapViewer;
