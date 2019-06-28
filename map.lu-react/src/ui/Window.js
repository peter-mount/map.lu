import React, {Component} from 'react';

class Window extends Component {
    setZIndex(zIndex) {
        this.zIndex=zIndex
    }

    render() {
        const props = this.props,
            title = props.title,
            icon = props.icon ? <i className={props.icon}/> : "";

        console.log("window render", this.zIndex);
        return <div className="window" id={props.id}>
            <div className="title">
                {icon}
                {props.title}
            </div>
            <div className="body">
                children
            </div>
        </div>
    }

}

export default Window;
