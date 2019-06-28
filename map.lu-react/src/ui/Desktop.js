import React, {Component} from 'react';

class Desktop extends Component {
    state = {
        // Windows in render order
        windows: [],
        // Windows by id
        wid: {}
    };

    render() {
        return <div id="desktop">
            <div>{this.props.children}</div>
            <div>{this.state.windows}</div>
        </div>
    }

    addWindow(window) {
        const state = this.state;

        state.wid[window.props.id] = window;
        state.windows.push(window);

        this.setState(state)
    }

    removeWindow(window) {
        const state = this.state;
        if (state.wid[window.props.id]) {
            delete state.wid[window.props.id];
            state.windows = state.windows.filter(w => w.props.id !== window.props.id);
            this.setState(state)
        }
    }
}

export default Desktop;
