/* example = {
    "_enabled": true,
    "direction": 0,
    "slideEvents": [],
    "_N$handle": { "__id__": 8 },
    "_N$progress": 0.5
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled   = parseUtils.transValue(comdata, '_enabled');
    com.direction = parseUtils.transValue(comdata, 'direction');
    com.handle    = parseUtils.transNode (comdata, '_N$handle', domdata);
    com.progress  = parseUtils.transValue(comdata, '_N$progress');
}