/* example = {
    "_enabled": true,
    "_N$string": "<color=#00ff00>Rich</c><color=#0fffff>Text</color>",
    "_N$horizontalAlign": 0,
    "_N$fontSize": 40,
    "_N$font": null,
    "_N$maxWidth": 0,
    "_N$lineHeight": 40,
    "_N$imageAtlas": null,

    "_N$handleTouchEvent": true,
    "_id": "7fAB1oqvhN2rfDiBE5hiIM"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {  
    com.enabled          = parseUtils.transValue(comdata, '_enabled');
    com.string           = parseUtils.transValue(comdata, '_N$string');
    com.horizontalAlign  = parseUtils.transValue(comdata, '_N$horizontalAlign');
    com.fontSize         = parseUtils.transValue(comdata, '_N$fontSize');
    com.font             = parseUtils.parseAsset(library, comdata[ '_N$font' ]);
    com.maxWidth         = parseUtils.transValue(comdata, '_N$maxWidth');
    com.lineHeight       = parseUtils.transValue(comdata, '_N$lineHeight');
    com.imageAtlas       = parseUtils.parseAsset(library, comdata[ '_N$imageAtlas' ]);
}