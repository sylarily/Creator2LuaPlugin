/* example = {
    "_enabled": true,
    "paused": false,
    "defaultSkin": "",
    "defaultAnimation": "animation",
    "loop": true,
    "premultipliedAlpha": false,
    "timeScale": 1,
    "debugSlots": false,
    "debugBones": false,
    "_N$skeletonData": { "__uuid__": "5cbd353b-c6a1-44d9-b29a-25648d28e02b" },

    "_srcBlendFactor": 770,
    "_dstBlendFactor": 771,
    "_id": "69oW+alEJNg6doYJSotLeq"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {  
    com.enabled       = parseUtils.transValue(comdata, '_enabled');
    com.paused        = parseUtils.transValue(comdata, 'paused');
    com.defaultSkin   = parseUtils.transValue(comdata, 'defaultSkin');
    com.defaultAnim   = parseUtils.transValue(comdata, 'defaultAnimation');
    com.loop          = parseUtils.transValue(comdata, 'loop');
    com.premultiplied = parseUtils.transValue(comdata, 'premultipliedAlpha');
    com.timeScale     = parseUtils.transValue(comdata, 'timeScale');
    com.debugSlots    = parseUtils.transValue(comdata, 'debugSlots');
    com.debugBones    = parseUtils.transValue(comdata, 'debugBones');
    com.skeleton      = parseUtils.parseAsset(library, comdata[ '_N$skeletonData' ]);
}