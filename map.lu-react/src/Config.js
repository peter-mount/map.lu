import config from 'react-global-configuration';

// Retrieve current config. usually only used to load the global configuration
export function getConfig() {
    let json;
    try {
        json = JSON.parse(localStorage.getItem('config'));
    } catch (e) {
        json = null;
    }
    // No json or has old config then reset to defaults
    if (!json || json.boards) {
        json = {
            map: {
                center: [51.505, -0.09],
                zoom: 9,
                baseLayer: "OS",
                overlays: [{
                    id: "OMR",
                    visible: true
                }, {
                    id: "OMRD",
                    visible: true
                }, {
                    id: "OMRS",
                    visible: true
                }]
            },
            expandStatus: true
        };
        saveConfig(json);
    }
    config.set(json, {freeze: false});
    return json;
}

// Save the config to local storage and update global configuration
export function saveConfig(json) {
    if (json) {
        localStorage.setItem('config', JSON.stringify(json));
        config.set(json, {freeze: false});
    }
}
