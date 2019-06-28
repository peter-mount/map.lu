import React, {Component} from 'react';

import {layers} from './Layers'
import Window from "./ui/Window";

function arrayMoveMutate(array, from, to) {
    array.splice(to < 0 ? array.length + to : to, 0, array.splice(from, 1)[0]);
}

function arrayMove(array, from, to) {
    array = array.slice();
    arrayMoveMutate(array, from, to);
    return array;
}

class LayerRow extends Component {
    render() {
        const props = this.props,
            def = props.def,
            layer = props.layer;
        return <div className="overlayRow">
            <span className="left" onClick={() => this.toggleVisibility()}>
                <i className={layer.visible ? "far fa-check-square" : "far fa-square"}/>
            </span>
            <span className="right" onClick={() => this.down()}>
                <i className="fas fa-caret-down"/>
            </span>
            <span className="right" onClick={() => this.up()}>
                <i className="fas fa-caret-up"/>
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

    up() {
        this.move((i, l) => i > 0, -1)
    }

    down() {
        this.move((i, l) => (i + 1) < l.length, 1)
    }

    move(test, offset) {
        const props = this.props,
            layer = props.layer,
            app = props.app,
            config = app.state,
            map = config.map,
            overlays = map.overlays,
            idx = overlays.findIndex(l => l.id === layer.id);
        if (test(idx, overlays)) {
            map.overlays = arrayMove(overlays, idx, idx + offset);
            map.forceRefresh = true;
            app.setState(app.state)
        }
    }
}

class LayerSelection extends Component {

    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        let openLayerDialog;
        if (config.openLayerDialog) {
            openLayerDialog = this.createOpenDialog()
        }

        return (
            <fieldset className="section overlays">
                <legend>Overlay layers</legend>
                <div className="title">
                    Overlay Layers
                    <i className="far fa-folder-open right icon" onClick={() => this.showOpenDialog()}/>
                </div>
                <div className="overlaysOuter">
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
                        {openLayerDialog}
                    </div>
                </div>
            </fieldset>
        )
    }

    showOpenDialog() {
        const app = this.props.app,
            config = app.state;
        if (!config.openLayerDialog) {
            config.openLayerDialog = true;
            app.setState(app.state)
        }
    }

    createOpenDialog() {
        return <Window
            id="openOverlayLayer"
            title="Add Overlay Layer"
            icon="far fa-folder-open"
        />
    }
}

export default LayerSelection;
