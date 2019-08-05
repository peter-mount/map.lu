import React, {Component} from 'react';

class Desktop extends Component {
    state = {
        // Windows in render order
        windows: [],
        // Windows by id
        wid: {},
        // Active dialog
        dialog: ""
    };

    render() {
        const props=this.props,
            state=this.state;
        return <div id="desktop">
            <div>{props.children}</div>
            <div>
                {state.windows}
                {state.dialog}
            </div>
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
        } else if(state.dialog && state.dialog.id === window.props.id) {
            // Handle dialogs
            state.dialog = ""
        }

        this.setState(state)
    }

    setDialog(window) {
        const state = this.state;
        if (state.dialog) {
            return false
        }
        state.dialog=window;
        this.setState(state);
        return true
    }
}

export default Desktop;
