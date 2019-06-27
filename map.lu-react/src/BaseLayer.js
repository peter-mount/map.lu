import React, {Component} from 'react';

import {layers} from './Layers'

class BaseLayer extends Component {

    selectLayer(id) {
        const app = this.props.app,
            config = app.state,
            map = config.map;
        map.baseLayer = id;
        app.setState(config)
    }

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        let baseLayers = [];
        layers.baseLayers.forEach(l => {
            baseLayers.push(<option key={l.id} value={l.id}>{l.label}</option>)
        });

        return <div className="section">
            <div className="title">Base Layer</div>
            <div>
                <select onChange={e => this.selectLayer(e.target.value)}>
                    {baseLayers}
                </select>
            </div>
        </div>
    }

}

export default BaseLayer;
