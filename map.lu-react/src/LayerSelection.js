import React, {Component} from 'react';

import {layers} from './Layers'

class LayerRow extends Component {
    render() {
        const props = this.props,
            def = props.def,
            layer = props.layer;
        return <div className="overlayRow">
            <span className="left" onClick={() => this.toggleVisibility()}>
                <i className={layer.visible ? "far fa-check-square" : "far fa-square"}/>
            </span>
            <span className="right">
                <i className="fas fa-caret-up"/>
                <i className="fas fa-caret-down"/>
            </span>
            <span className="label">{def.label}</span>
        </div>
    }

    toggleVisibility() {
        const props = this.props,
            layer = props.layer,
            app = props.app;
        layer.visible = !layer.visible;
        app.setState(app.state)
    }
}

class LayerSelection extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        return <div className="section">
            <div className="title">Overlay Layers</div>
            <div className="overlays">
                {
                    map.overlays.reduce((a, layer) => {
                        layers.overlayLayers.filter(l => l.id === layer.id)
                            .forEach(l => {
                                a.push(<LayerRow key={l.id} def={l} layer={layer} app={app}/>)
                            });
                        return a;
                    }, [])
                }
            </div>
        </div>
    }

}

export default LayerSelection;
