import React, {Component} from 'react';

class Desktop extends Component {
    state = {
        // Windows in render order
        windows: [],
        // Windows by id
        wid: {}
    };

    render() {
        const props = this.props;

        console.log("render", this.state.windows);

        return <div id="desktop">
            <div>{this.props.children}</div>
            <div>{this.state.windows}</div>
        </div>
    }

    addWindow(window) {
        const state = this.state;

        console.log("addWindow", window.key);
        state.wid[window.key] = window;
        state.windows.push(window);
        console.log("addWindow", state.wid, state.windows);
        this.setState(state)
    }
}

export default Desktop;
