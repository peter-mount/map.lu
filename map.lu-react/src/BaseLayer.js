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

        return <div className="section">
            <div className="title">Base Layer</div>
            <div>
                <select id="baseLayer" value={map.baseLayer} onChange={e => this.selectLayer(e.target.value)}>
                    {
                        layers.baseLayers.reduce((a, l) => {
                            a.push(<option key={l.id} value={l.id}>{l.label}</option>);
                            return a
                        }, [])
                    }
                </select>
            </div>
        </div>
    }

}

export default BaseLayer;
