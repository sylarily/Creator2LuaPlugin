/* example = {
    "_enabled": true,
    "_N$target": { "__id__": 10 },
    "_N$interactable": true,
    "_N$enableAutoGrayEffect": false,
    "transition": 2,
    "_N$normalColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "pressedColor": { "__type__": "cc.Color", "r": 77, "g": 77, "b": 77, "a": 255 },
    "hoverColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_N$disabledColor": { "__type__": "cc.Color", "r": 92, "g": 92, "b": 92, "a": 255 },
    "_N$normalSprite": { "__uuid__": "28031c6f-e325-48a0-88d8-18bf712e15bc" },
    "_N$pressedSprite": { "__uuid__": "a07674c1-9e54-4ab3-a767-4738424db091" },
    "_N$hoverSprite": null,
    "_N$disabledSprite": { "__uuid__": "a07674c1-9e54-4ab3-a767-4738424db091" },
    "duration": 0.1,
    "zoomScale": 1.2,
    "_N$isChecked": true,
    "toggleGroup": null,
    "checkMark": { "__id__": 13 },

    "clickEvents": [],    
    "checkEvents": [],
    "_id": "74xIDFYKdFi7dDuOnpu8AA"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {  
    com.enabled      = parseUtils.transValue(comdata, '_enabled');
    com.target       = parseUtils.transNode (comdata, '_N$target', domdata);
    com.interactable = parseUtils.transValue(comdata, '_N$interactable');
    com.autogray     = parseUtils.transValue(comdata, '_N$enableAutoGrayEffect');
    com.transition   = parseUtils.transValue(comdata, 'transition');
    com.ncolor       = parseUtils.transColor(comdata, '_N$normalColor');
    com.pcolor       = parseUtils.transColor(comdata, 'pressedColor');
    com.hcolor       = parseUtils.transColor(comdata, 'hoverColor');
    com.dcolor       = parseUtils.transColor(comdata, '_N$disabledColor');
    com.nsprite      = parseUtils.parseAsset(library, comdata[ '_N$normalSprite' ]);
    com.psprite      = parseUtils.parseAsset(library, comdata[ '_N$pressedSprite' ]);
    com.hsprite      = parseUtils.parseAsset(library, comdata[ '_N$hoverSprite' ]);
    com.dsprite      = parseUtils.parseAsset(library, comdata[ '_N$disabledSprite' ]);
    com.duration     = parseUtils.transValue(comdata, 'duration');
    com.zoomscale    = parseUtils.transValue(comdata, 'zoomScale');
    com.checked      = parseUtils.transValue(comdata, '_N$isChecked');
    com.group        = parseUtils.transNode (comdata, 'toggleGroup', domdata);
    com.checkmark    = parseUtils.transNode (comdata, 'checkMark', domdata);
}