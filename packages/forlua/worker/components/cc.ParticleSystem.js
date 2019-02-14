/* example = {
    "_enabled": true,
    "_srcBlendFactor": 770,
    "_dstBlendFactor": 1,
    "playOnLoad": true,
    "autoRemoveOnFinish": false,
    "_custom": true,
    "_file": { "__uuid__": "fa2bc737-db09-456f-9529-418b1f2b9a7a" },
    "_spriteFrame": { "__uuid__": "9128ea69-79f5-45bd-9b3b-830f257f7b1b" },

    "totalParticles": 5,
    "duration": -1,
    "emissionRate": 1.25,
    "life": 4, "lifeVar": 1,
    "_startColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 15 },
    "_startColorVar": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 2 },
    "_endColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_endColorVar": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "angle": 90, "angleVar": 0,
    "startSize": 20, "startSizeVar": 10, "endSize": 35, "endSizeVar": 10,
    "startSpin": 0, "startSpinVar": 90, "endSpin": 0, "endSpinVar": 90,
    "positionType": 0,
    "sourcePos": { "__type__": "cc.Vec2", "x": 0, "y": 0 },
    "posVar": { "__type__": "cc.Vec2", "x": 150, "y": 30 },
    "emitterMode": 0,
    "gravity": { "__type__": "cc.Vec2", "x": 0, "y": 5 },
    "speed": 10, "speedVar": 10,
    "tangentialAccel": 0, "tangentialAccelVar": 0, "radialAccel": 0, "radialAccelVar": 0,
    "rotationIsDir": false,
    "startRadius": 0, "startRadiusVar": 0, "endRadius": 0, "endRadiusVar": 0,
    "rotatePerS": 0, "rotatePerSVar": 0,

    "_stopped": true,
    "_N$preview": true,
    "_id": "3dY9+1TbZG16DL25ebAjrJ"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled            = parseUtils.transValue(comdata, '_enabled');
    com.srcBlendFactor     = parseUtils.transValue(comdata, '_srcBlendFactor');
    com.dstBlendFactor     = parseUtils.transValue(comdata, '_dstBlendFactor');
    com.playOnLoad         = parseUtils.transValue(comdata, 'playOnLoad');
    com.autoRemoveOnFinish = parseUtils.transValue(comdata, 'autoRemoveOnFinish');
    com.custom             = parseUtils.transValue(comdata, '_custom');
    com.file               = parseUtils.parseAsset(library, comdata[ "_file" ]);
    com.spriteFrame        = parseUtils.parseAsset(library, comdata[ "_spriteFrame" ]);

    /*
    com.totalParticles     = parseUtils.transValue(comdata, 'totalParticles');
    com.duration           = parseUtils.transValue(comdata, 'duration');
    com.emissionRate       = parseUtils.transValue(comdata, 'emissionRate');
    com.life               = parseUtils.transValue(comdata, 'life');
    com.lifeVar            = parseUtils.transValue(comdata, 'lifeVar');
    com.startColor         = parseUtils.transColor(comdata, '_startColor');
    com.startColorVar      = parseUtils.transColor(comdata, '_startColorVar');
    com.endColor           = parseUtils.transColor(comdata, '_endColor');
    com.endColorVar        = parseUtils.transColor(comdata, '_endColorVar');
    com.angle              = parseUtils.transValue(comdata, 'angle');
    com.angleVar           = parseUtils.transValue(comdata, 'angleVar');
    com.startSize          = parseUtils.transValue(comdata, 'startSize');
    com.startSizeVar       = parseUtils.transValue(comdata, 'startSizeVar');
    com.endSize            = parseUtils.transValue(comdata, 'endSize');
    com.endSizeVar         = parseUtils.transValue(comdata, 'endSizeVar');
    com.startSpin          = parseUtils.transValue(comdata, 'startSpin');
    com.startSpinVar       = parseUtils.transValue(comdata, 'startSpinVar');
    com.endSpin            = parseUtils.transValue(comdata, 'endSpin');
    com.endSpinVar         = parseUtils.transValue(comdata, 'endSpinVar');
    com.positionType       = parseUtils.transValue(comdata, 'positionType');
    com.sourcePos          = parseUtils.transVec2 (comdata, 'sourcePos');
    com.posVar             = parseUtils.transVec2 (comdata, 'posVar');
    com.emitterMode        = parseUtils.transValue(comdata, 'emitterMode');
    com.gravity            = parseUtils.transVec2 (comdata, 'gravity');
    com.speed              = parseUtils.transValue(comdata, 'speed');
    com.speedVar           = parseUtils.transValue(comdata, 'speedVar');
    com.tangentialAccel    = parseUtils.transValue(comdata, 'tangentialAccel');
    com.tangentialAccelVar = parseUtils.transValue(comdata, 'tangentialAccelVar');
    com.radialAccel        = parseUtils.transValue(comdata, 'radialAccel');
    com.radialAccelVar     = parseUtils.transValue(comdata, 'radialAccelVar');
    com.rotationIsDir      = parseUtils.transValue(comdata, 'rotationIsDir');
    com.startRadius        = parseUtils.transValue(comdata, 'startRadius');
    com.startRadiusVar     = parseUtils.transValue(comdata, 'startRadiusVar');
    com.endRadius          = parseUtils.transValue(comdata, 'endRadius');
    com.endRadiusVar       = parseUtils.transValue(comdata, 'endRadiusVar');
    com.rotatePerS         = parseUtils.transValue(comdata, 'rotatePerS');
    com.rotatePerSVar      = parseUtils.transValue(comdata, 'rotatePerSVar');
    */
}