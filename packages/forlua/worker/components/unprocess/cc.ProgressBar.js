/* example = {
    "_enabled": true,
    "_N$totalLength": 195,
    "_N$barSprite": { "__id__": 16 },
    "_N$mode": 0,
    "_N$progress": 1,
    "_N$reverse": false
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled     = parseUtils.transValue(comdata, '_enabled');
    com.totalLength = parseUtils.transValue(comdata, '_N$totalLength');
    com.barSprite   = parseUtils.transNode (comdata, '_N$barSprite', domdata);
    com.mode        = parseUtils.transValue(comdata, '_N$mode');
    com.progress    = parseUtils.transValue(comdata, '_N$progress');
    com.reverse     = parseUtils.transValue(comdata, '_N$reverse');
}