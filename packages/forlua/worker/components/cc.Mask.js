/* example = {
    "_enabled": true,
    "_type": 2,
    "_N$inverted": false,
    "_segments": 64,
    "_spriteFrame": { "__uuid__": "84854b4c-cfe2-4384-9623-824f4d22d1f6" },
    "_N$alphaThreshold": 0.7,

    "_srcBlendFactor": 770,
    "_dstBlendFactor": 771,
    "_id": "1ffMwExPJJpYUu6eiGFgB8"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled         = parseUtils.transValue(comdata, '_enabled');
    com.modeType        = parseUtils.transValue(comdata, '_type');
    com.inverted        = parseUtils.transValue(comdata, '_N$inverted');
    com.segements       = parseUtils.transValue(comdata, '_segments');
    com.spriteFrame     = parseUtils.parseAsset(library, comdata[ '_spriteFrame' ]);
    com.alphaThreshold  = parseUtils.transValue(comdata, '_N$alphaThreshold');
}