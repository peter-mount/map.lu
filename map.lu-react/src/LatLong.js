import React, {Component} from 'react';

/**
 * Converts decimal degrees to degrees minutes seconds.
 *
 * @param dd the decimal degrees value.
 * @param isLng specifies whether the decimal degrees value is a longitude.
 * @return degrees minutes seconds string in the format 49°15'51.35"N
 */
function convertToDms(dd, isLng) {
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
    return <span>
            <span className="deg">{deg}°</span>
            <span className="min">{min}'</span>
            <span className="sec">{sed}.{ses}"</span>
            <span className="dir">{dir}</span>
        </span>;
}

class LatLong extends Component {
    render() {
        const props = this.props,
            lon = props.longitude,
            lat = props.latitude;
        return <div className="details">
            <div>
                <span className="label">Lat</span>
                {convertToDms(lat, false)}
            </div>
            <div>
                <span className="label">Lon</span>
                {convertToDms(lon, true)}
            </div>
        </div>;
    }
}

export default LatLong;
