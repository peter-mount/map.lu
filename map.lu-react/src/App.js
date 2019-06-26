import React, {Component} from 'react';
import './App.css';
import {getConfig} from "./Config";
import MapStatus from "./MapStatus";
import MapViewer from "./MapViewer"
import Navbar from "./Navbar";

class App extends Component {
    constructor(props) {
        super(props);

        this.state = getConfig()
    }

    render() {
        return (
            <div className="App">
                <Navbar/>
                <MapViewer app={this}/>
                <MapStatus app={this}/>
            </div>
        );
    }
}

export default App;
