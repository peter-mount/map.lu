import React, {Component} from 'react';

class BaseLayer extends Component {

    selectLayer(id) {
        const app = this.props.app,
            config = app.state,
            map = config.map;

        // Change the baseLayer & force the map to be refreshed
        map.baseLayer = id;
        map.forceRefresh = true;

        app.setState(config)
    }

    render() {
        const app = this.props.app,
            config = app.state,
            baseLayers = config.baseLayers,
            map = config.map;

        return <div className="section">
            <div className="title">Base Layer</div>
            <div>
                <select id="baseLayer" value={map.baseLayer} onChange={e => this.selectLayer(e.target.value)}>
                    {
                        Object.keys(baseLayers)
                            .map(k => baseLayers[k])
                            .sort((a, b) => {
                                const al = a.label.toUpperCase(),
                                    bl = b.label.toUpperCase();
                                return al < bl ? -1 : al > bl ? 1 : 0
                            })
                            .map(l => <option key={l.id} value={l.id}>{l.label}</option>)
                    }
                </select>
            </div>
        </div>
    }

}

export default BaseLayer;
