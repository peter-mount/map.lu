import React, {Component} from 'react';

class Window extends Component {

    render() {
        const props = this.props;

        return <div className="window" id={props.id}>
            <div className="windowTitle">
                {props.icon ? <i className={props.icon}/> : ""}
                {props.title}
                {props.closeable ?
                    <i className="far fa-times-circle icon windowRight" onClick={() => this.close()}/> : ""}
            </div>
            <div className="windowBody">{props.children}</div>
        </div>
    }

    close() {
        if (this.props.desktop) {
            this.props.desktop.removeWindow(this)
        }
    }
}

export default Window;
