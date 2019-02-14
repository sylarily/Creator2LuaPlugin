/* example = {
    "_enabled": true,
    "_type": 0,
    "_sizeMode": 1,
    "_fillType": 0,
    "_fillCenter": { "__type__": "cc.Vec2", "x": 0, "y": 0 },
    "_fillStart": 0,
    "_fillRange": 0,
    "_isTrimmedMode": true,
    "_srcBlendFactor": 770,
    "_dstBlendFactor": 771,
    "_spriteFrame": { "__uuid__": "28031c6f-e325-48a0-88d8-18bf712e15bc" },

    "_state": 0,
    "_id": "168OJXUlxPsr4MFWWIVOz6",
    "_atlas": { "__uuid__": "fbe65d6d-aac1-4ad2-b80a-e73a3ef76f34" }
} */

const parseUtils = require("../parse-utils");

module.exports = function (com, library, domdata, comdata) { 
    com.enabled     = parseUtils.transValue(comdata, '_enabled');
    com.renderType  = parseUtils.transValue(comdata, '_type');
    com.sizeMode    = parseUtils.transValue(comdata, '_sizeMode');
    com.fillType    = parseUtils.transValue(comdata, '_fillType');
    com.fillCenter  = parseUtils.transVec2 (comdata, '_fillCenter');
    com.fillStart   = parseUtils.transValue(comdata, '_fillStart');
    com.fillRange   = parseUtils.transValue(comdata, '_fillRange');
    com.trimmedMode = parseUtils.transValue(comdata, '_isTrimmedMode');
    com.srcBlend    = parseUtils.transValue(comdata, '_srcBlendFactor');
    com.dstBlend    = parseUtils.transValue(comdata, '_dstBlendFactor');
    com.spriteFrame = parseUtils.parseAsset(library, comdata[ '_spriteFrame' ]);
}