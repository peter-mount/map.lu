import React, {Component} from 'react';
import Window from "./Window";

class Dialog extends Component {

    render() {
        const props = this.props;

        return (
            <div className="dialog">
                <Window
                    id="desktopDialog"
                    closeable={true}
                    title={props.title}
                    desktop={props.desktop}
                    >
                    {props.children}
                </Window>
            </div>
        )
    }
}

export default Dialog;
