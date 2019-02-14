/* example = {
    "_enabled": true,
    "alignMode": 0,
    "_target": { "__id__": 9 },
    "_alignFlags": 41,
    "_left": 0.10000000000000002,
    "_right": 0,
    "_top": -10,
    "_bottom": 0,
    "_verticalCenter": 0,
    "_horizontalCenter": 0,
    "_isAbsLeft": false,
    "_isAbsRight": true,
    "_isAbsTop": true,
    "_isAbsBottom": true,
    "_isAbsHorizontalCenter": true,
    "_isAbsVerticalCenter": true,

    "_originalWidth": 50,
    "_originalHeight": 0,
    "_id": "9bpzNtDVZHaIvqBBySKCDd"
} */

const parseUtils = require("../parse-utils");

module.exports = function (com, library, domdata, comdata) { 
    com.enabled      = parseUtils.transValue(comdata, '_enabled');
    com.mode         = parseUtils.transValue(comdata, 'alignMode');
    com.target       = parseUtils.transNode (comdata, '_target', domdata);
    com.alignFlags   = parseUtils.transValue(comdata, '_alignFlags');
    com.left         = parseUtils.transVec2 (comdata, '_left');
    com.right        = parseUtils.transValue(comdata, '_right');
    com.top          = parseUtils.transValue(comdata, '_top');
    com.bottom       = parseUtils.transValue(comdata, '_bottom');
    com.vcenter      = parseUtils.transValue(comdata, '_verticalCenter');
    com.hcenter      = parseUtils.transValue(comdata, '_horizontalCenter');
    com.isAbsLeft    = parseUtils.transVec2 (comdata, '_isAbsLeft');
    com.isAbsRight   = parseUtils.transValue(comdata, '_isAbsRight');
    com.isAbsTop     = parseUtils.transValue(comdata, '_isAbsTop');
    com.isAbsBottom  = parseUtils.transValue(comdata, '_isAbsBottom');
    com.isAbsHcenter = parseUtils.transValue(comdata, '_isAbsHorizontalCenter');
    com.isAbsVcenter = parseUtils.transValue(comdata, '_isAbsVerticalCenter');
}