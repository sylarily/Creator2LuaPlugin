/* example = {
    "_enabled": true,
    "_color": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_width": 1,

    "_id": "30Dx+RFbpI7J0q/l8LBoiJ"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled = parseUtils.transValue(comdata, '_enabled');
    com.color   = parseUtils.transColor(comdata, '_color');
    com.width   = parseUtils.transValue(comdata, '_width');
}