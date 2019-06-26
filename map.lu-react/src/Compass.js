import React, {Component} from 'react';
import {config} from "./App";

// The compass rose for navigation
class Compass extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center, map.zoom);

        return <div id="compass">
            <div className="nav">
                <div>
                    <i className="fas fa-arrow-up"/>
                </div>
                <div>
                    <i className="fas fa-arrow-left"/>
                    <i className="fas fa-home"/>
                    <i className="fas fa-arrow-right"/>
                </div>
                <div>
                    <i className="fas fa-arrow-down"/>
                </div>
            </div>
            <div className="zoom">
                <i className="fas fa-angle-left" onClick={() => this.zoomOut()}/>
                <span>{map.zoom}</span>
                <i className="fas fa-angle-right" onClick={() => this.zoomIn()}/>
            </div>
        </div>
    }

    zoomIn() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        if (map.zoom < 19) {
            map.zoom = map.zoom + 1
            app.setState(config)
        }
    }

    zoomOut() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        if (map.zoom > 0) {
            map.zoom = map.zoom - 1
            app.setState(config)
        }
    }
}

export default Compass;
