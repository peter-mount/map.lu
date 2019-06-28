import React, {Component} from 'react';
import './App.css';
import MapStatus from "./MapStatus";
import MapViewer from "./MapViewer"
import yaml from "js-yaml";
import Desktop from "./ui/Desktop";
import StatusBar, {StatusBarPanel} from "./ui/StatusBar";
import LatLong from "./LatLong";

class App extends Component {
    constructor(props) {
        super(props);

        this.state = {}
    }

    addWindow(window) {
        this.desktop.addWindow(window)
    }

    setStatus(text) {
        this.status.setText(text)
    }

    render() {
        const config = this.state;
        let content;
        if (this.state.version) {
            content = <span>
                <MapViewer app={this}/>
                <div id="Attribution">
                    Map imagery ©2012-2019 Peter Mount, map.lu & others: more information
                </div>
                <MapStatus app={this}/>
            </span>
        } else if (!this.timer) {
            this.timer = setInterval(() => this.loadLayers(), 250);
        }

        return (
            <Desktop ref={desktop => this.desktop = desktop}>
                {content}
                <StatusBar>
                    <LatLong latitude={config.map ? config.map.center[0] : 0}
                             longitude={config.map ? config.map.center[1] : 0}/>
                    <StatusBarPanel
                        id="mainStatus"
                        ref={t => this.status = t}
                        text="ProjectArea51 & area51.onl ©2011-2018 Peter Mount, All Rights Reserved."
                    />
                </StatusBar>
            </Desktop>
        );
    }

    loadLayers() {
        clearInterval(this.timer)
        this.setStatus("Requesting layers.yaml")
        fetch("/layers.yaml")
            .then(res => res.text())
            .then(doc => yaml.safeLoad(doc))
            .then(config => walkLayer(config, config.baseLayers))
            .then(config => walkLayer(config, config.overlayLayers))
            .then(config => this.setState(config))
            .then(() => this.setStatus("Loaded layers.yaml"))
            .catch(e => {
                this.setStatus("Failed to load layers.yaml");
                console.error("Failed to load layers.yaml", e);
                alert("Failed to load available layers")
            });

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
