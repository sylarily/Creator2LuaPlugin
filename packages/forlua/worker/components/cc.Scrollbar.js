/* example = {
    "_enabled": true,
    "_N$handle": { "__id__": 24 },
    "_N$direction": 1,
    "enableAutoHide": true,
    "autoHideTime": 1,
    
    "_scrollView": { "__id__": 26 },
    "_touching": false,
    "_opacity": 255,
    "_id": "c9p62U4IZDbaLuRCdwEDth"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled         = parseUtils.transValue(comdata, '_enabled');
    com.handle          = parseUtils.transNode (comdata, '_N$handle', domdata);
    com.direction       = parseUtils.transValue(comdata, '_N$direction');
    com.enableAutoHide  = parseUtils.transValue(comdata, 'enableAutoHide');
    com.autoHideTime    = parseUtils.transValue(comdata, 'autoHideTime');
}