import React, {Component} from 'react';
import {StatusBarPanel} from "./ui/StatusBar";

/**
 * Converts decimal degrees to degrees minutes seconds.
 *
 * @param dd the decimal degrees value.
 * @param isLng specifies whether the decimal degrees value is a longitude.
 * @return degrees minutes seconds string in the format 49°15'51.35"N
 */
function convertToDms(label, dd, isLng) {
    const dir = dd < 0
        ? isLng ? 'W' : 'S'
        : isLng ? 'E' : 'N',
        absDd = Math.abs(dd),
        deg = absDd | 0,
        frac = absDd - deg,
        min = (frac * 60) | 0,
        sec = Math.round((frac * 3600 - min * 60) * 100) / 100,
        sed = sec | 0,
        sef = Math.round((sec - sed) * 100) | 0,
        ses = (sef < 10 ? "0" : "") + sef;
    //return deg + "°" + min + "'" + sec + '"' + dir;
    return [
        <span key="l" className="label">{label}</span>,
        <span key="d" className="deg">{deg}°</span>,
        <span key="m" className="min">{min}'</span>,
        <span key="s" className="sec">{sed}.{ses}"</span>,
        <span key="h" className="dir">{dir}</span>
    ]
}

class LatLong extends Component {
    render() {
        const props = this.props,
            lon = props.longitude,
            lat = props.latitude;
        return (
            <StatusBarPanel id="latlongstatus">
                {convertToDms("Lat", lat, false)}
                {convertToDms("Lon", lon, true)}
            </StatusBarPanel>
        )
    }
}

export default LatLong;
