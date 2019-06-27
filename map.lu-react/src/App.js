import React, {Component} from 'react';
import './App.css';
import MapStatus from "./MapStatus";
import MapViewer from "./MapViewer"
import Navbar from "./Navbar";
import yaml from "js-yaml";

class App extends Component {
    constructor(props) {
        super(props);

        this.state = {}
    }

    render() {
        if (this.state.version) {
            return (
                <div className="App">
                    <Navbar/>
                    <MapViewer app={this}/>
                    <MapStatus app={this}/>
                </div>
            );
        }

        if (!this.state.loadLayers) {
            this.state.loadLayers = true;

            const t = this;
            fetch("/layers.yaml")
                // Convert yaml to an object
                .then(res => res.text())
                .then(doc => yaml.safeLoad(doc))
                // Add layers lookup map keyed by id
                .then(cfg => {
                    cfg.layers = {}
                    walkLayer(cfg.layers, cfg.baseLayers)
                    walkLayer(cfg.layers, cfg.overlayLayers)
                    return cfg;
                })
                // Finish by setting state
                .then(cfg => {
                    cfg.layers = true;
                    t.setState(cfg)
                })
                .catch(e => {
                    console.error(e);
                    alert("Failed to load available layers")
                })
        }

        return <div>Loading</div>
    }
}

function walkLayer(dest, layer) {
    if (layer.id) {
        if (dest[layer.id]) {
            // Should not happen, dissalow the duplicate
            console.error("Duplicate id", layer.id)
        } else {
            dest[layer.id] = layer
        }
    } else {
        Object.keys(layer)
            .filter(k => layer[k].id || layer[k].group)
            .forEach(k => walkLayer(dest, layer[k]))
    }
}

export default App;
