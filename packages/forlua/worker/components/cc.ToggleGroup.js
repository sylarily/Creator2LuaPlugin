/* example = {
    "_enabled": true,
    "allowSwitchOff": false,

    "_id": "d5PL//uvRJ4pnSS1OQ+O5m"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled         = parseUtils.transValue(comdata, '_enabled');
    com.allowSwitchOff  = parseUtils.transValue(comdata, 'allowSwitchOff');
}