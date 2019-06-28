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

        // force us to update as well
        // FIXME why doesn't this get updated?
        this.setState(new Date());
    }

    render() {
        const props = this.props,
            app = props.app,
            config = app.state,
            baseLayers = config.baseLayers,
            map = config.map;

        return (
            <fieldset className={"section " + props.className}>
                <legend>Base layer</legend>
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
            </fieldset>
        )
    }

}

export default BaseLayer;
