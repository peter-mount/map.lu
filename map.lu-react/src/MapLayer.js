import React, {Component} from 'react';
import {TileLayer, WMSTileLayer} from 'react-leaflet'

class MapLayer extends Component {

    render() {
        const props = this.props,
            layer = props.layer,
            id = layer.id,
            tileLayer = layer.tileLayer,
            wms = layer.wms;

        if (tileLayer) {
            return <TileLayer key={id} url={tileLayer}/>
        }

        if (wms) {
            return <WMSTileLayer key={id} url={wms.server} layers={wms.layers}/>
        }

        return "";
    }
}

export default MapLayer;
