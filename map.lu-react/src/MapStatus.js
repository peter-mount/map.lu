import React, {Component} from 'react';
import Compass from "./Compass";
import BaseLayer from "./BaseLayer";
import LayerSelection from "./LayerSelection";

class MapStatus extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center, map.zoom);

        if (!config.expandStatus) {
            return <div id="mapStatus" className="closed">
                <Compass app={app}/>
                <i
                    className="right icon far fa-caret-square-right"
                    onClick={() => this.toggle()}
                />
            </div>
        }

        return <div id="mapStatus" className="open">
            <Compass app={app}/>
            <i
                className="right icon fas fa-caret-square-down"
                onClick={() => this.toggle()}
            />

            <BaseLayer app={app}/>

            <LayerSelection app={app}/>

        </div>
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
