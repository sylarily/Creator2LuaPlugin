/* example = {
    "_enabled": true,
    "_N$layoutType": 0,
    "_resize": 0,
    "_N$paddingLeft": 0,
    "_N$paddingRight": 0,
    "_N$paddingTop": 0,
    "_N$paddingBottom": 0,
    "_N$spacingX": 0,
    "_N$spacingY": 0,
    "_N$verticalDirection": 1,
    "_N$horizontalDirection": 0,
    "_N$startAxis": 0,

    "_layoutSize": { "__type__": "cc.Size", "width": 300, "height": 200 },
    "_N$padding": 0,
    "_N$cellSize": { "__type__": "cc.Size", "width": 40, "height": 40 },
    "_id": "69iRbxmJtJF6XUqGkMd7Op"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled       = parseUtils.transValue(comdata, '_enabled');
    com.layoutType    = parseUtils.transValue(comdata, '_N$layoutType');
    com.resize        = parseUtils.transValue(comdata, '_resize');
    com.paddingLeft   = parseUtils.transValue(comdata, '_N$paddingLeft');
    com.paddingRight  = parseUtils.transValue(comdata, '_N$paddingRight');
    com.paddingTop    = parseUtils.transValue(comdata, '_N$paddingTop');
    com.paddingBottom = parseUtils.transValue(comdata, '_N$paddingBottom');
    com.spacingX      = parseUtils.transValue(comdata, '_N$spacingX');
    com.spacingY      = parseUtils.transValue(comdata, '_N$spacingY');
    com.vdirection    = parseUtils.transValue(comdata, '_N$verticalDirection');
    com.hdirection    = parseUtils.transValue(comdata, '_N$horizontalDirection');
    com.startAxis     = parseUtils.transValue(comdata, '_N$startAxis');
}
