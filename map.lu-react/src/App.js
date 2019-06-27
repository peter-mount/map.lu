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

        fetch("/layers.yaml")
            .then(res => res.text())
            .then(doc => yaml.safeLoad(doc))
            .then(config => walkLayer(config, config.baseLayers))
            .then(config => walkLayer(config, config.overlayLayers))
            .then(config => this.setState(config))
            .catch(e => {
                console.error(e);
                alert("Failed to load available layers")
            });

        return <div>Loading</div>
    }
}

function walkLayer(config, layer) {
    if (!config.layers) {
        config.layers = {}
    }
    if (layer.id) {
        if (config.layers[layer.id]) {
            // Should not happen, dissalow the duplicate
            console.error("Duplicate id", layer.id)
        } else {
            config.layers[layer.id] = layer
        }
    } else {
        Object.keys(layer)
            .filter(k => layer[k].id || layer[k].group)
            .forEach(k => walkLayer(config, layer[k]))
    }
    return config
}

export default App;
