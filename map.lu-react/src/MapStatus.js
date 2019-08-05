import React, {Component} from 'react';
import Compass from "./Compass";
import BaseLayer from "./BaseLayer";
import LayerSelection from "./LayerSelection";
import Window from "./ui/Window";

class MapStatus extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center, map.zoom);

        return <div id="mapStatus" className="closed">
            <Compass app={app}/>
            <i
                className="right icon far fa-caret-square-right"
                onClick={() => this.openStatus()}
            />
        </div>
    }

    openStatus() {
        const app = this.props.app;
        console.log("openStatus",app.desktop)
        app.desktop.addWindow(
            <Window key="layersWindow" id="layersWindow" desktop={app.desktop} title="Map Layers" closeable={true}>
                <BaseLayer className="baseLayer" app={app}/>

                <LayerSelection app={app}/>
            </Window>
        )
    }

    toggle() {
        const app = this.props.app,
            config = app.state;
        config.expandStatus = !config.expandStatus;
        app.setState(config)
        console.log("config.expandStatus", config.expandStatus)
    }
}

export default MapStatus;
