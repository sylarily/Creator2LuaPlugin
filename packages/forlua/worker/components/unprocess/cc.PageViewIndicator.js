/* example = {
    "_enabled": true,
    "_layout": null,
    "_pageView": { "__id__": 50 },
    "_indicators": [],
    "spriteFrame": { "__uuid__": "c9fa51ff-3f01-4601-8f80-325d1b11dab7" },
    "direction": 0,
    "cellSize": { "__type__": "cc.Size", "width": 10, "height": 10 },
    "spacing": 10
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled     = parseUtils.transValue(comdata, '_enabled');
    com.pageView    = parseUtils.transNode (comdata, '_pageView', domdata);
    com.spriteFrame = parseUtils.parseAsset(library, comdata[ 'spriteFrame' ]);
    com.direction   = parseUtils.transValue(comdata, 'direction');
    com.cellSize    = parseUtils.transSize (comdata, 'cellSize');
    com.spacing     = parseUtils.transValue(comdata, 'spacing');
}