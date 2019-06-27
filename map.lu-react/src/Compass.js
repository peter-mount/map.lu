import React, {Component} from 'react';

// The compass rose for navigation
class Compass extends Component {
    render() {
        const app = this.props.app,
            config = app.state,
            map = config.map,
            ce=map.center,
            lon=ce[0],
            lat=ce[1],
            z=map.zoom;

        console.log(map.center, map.zoom);
        var details;
        if(config.expandStatus) {
            details = <div className="details">
                <div>
                    <span>Long</span>
                    <span>{lon}</span>
                </div>
                <div>
                    <span>Lat</span>
                    <span>{lat}</span>
                </div>
            </div>;
        }

        return <div id="compass">
            <div className="nav">
                <div>
                    <i className="fas fa-arrow-up" onClick={() => this.north()}/>
                </div>
                <div>
                    <i className="fas fa-arrow-left"/>
                    <i className="fas fa-home"/>
                    <i className="fas fa-arrow-right"/>
                </div>
                <div>
                    <i className="fas fa-arrow-down" onClick={() => this.south()}/>
                </div>
                <div className="zoom">
                    <i className="fas fa-angle-left" onClick={() => this.zoomOut()}/>
                    <span>{z}</span>
                    <i className="fas fa-angle-right" onClick={() => this.zoomIn()}/>
                </div>
            </div>
            {details}
        </div>
    }

    latPixel() {
        const app = this.props.app,
            config = app.state,
            map = config.map;
        //return 40075016.686 * Math.cos(map.center[0]*Math.PI/180.0)/(2^map.zoom)
        console.log(map.zoom, Math.pow(2, map.zoom))
        return 360.0 * Math.cos(map.center[0] * Math.PI / 180.0) / Math.pow(2, map.zoom)
    }

    north() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center);
        map.center[0] = Math.min(90, map.center[0] + this.latPixel());
        console.log(map.center);
        app.setState(config)
    }

    south() {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        console.log(map.center);
        map.center[0] = Math.max(-90, map.center[0] - this.latPixel());
        console.log(map.center);
        app.setState(config)
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
