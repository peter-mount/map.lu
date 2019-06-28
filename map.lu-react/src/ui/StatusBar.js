import React, {Component} from 'react';

export default class StatusBar extends Component {

    render() {
        const props = this.props;
        return <div id="desktopStatusBar">{props.children}</div>
    }

}

export class StatusBarPanel extends Component {
    state = {
        text: ""
    };

    componentWillMount() {
        if (this.props.text) {
            this.state.text = this.props.text;
        }
    }

    render() {
        const props = this.props,
            state = this.state,
            text = state.text;
        return <span id={props.id} className="statusBarPanel">{props.children} {text}</span>
    }

    setText(text) {
        const state = this.state;
        state.text = text;
        this.setState(state)
    }
}
