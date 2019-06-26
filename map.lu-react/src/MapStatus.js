import React, {Component} from 'react';
import {config} from "./App";
import Compass from "./Compass";

class MapStatus extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center, map.zoom);

        return <div id="mapStatus">
            <Compass app={app}/>
        </div>
    }
}

export default MapStatus;
