/* example = {
    "_enabled": true,
    "_N$target": { "__id__": 3 },
    "_N$interactable": true,
    "_N$enableAutoGrayEffect": false,
    "transition": 3,
    "_N$normalColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "pressedColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "hoverColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_N$disabledColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_N$normalSprite": { "__uuid__": "28031c6f-e325-48a0-88d8-18bf712e15bc" },
    "_N$pressedSprite": { "__uuid__": "e9ec654c-97a2-4787-9325-e6a10375219a" },
    "_N$hoverSprite": { "__uuid__": "e9ec654c-97a2-4787-9325-e6a10375219a" },
    "_N$disabledSprite": { "__uuid__": "29158224-f8dd-4661-a796-1ffab537140e" },
    "duration": 0.1,
    "zoomScale": 1.2,
    
    "_id": "8cB2MQ311JNJpUMoJ7vAUC",
    "clickEvents": [],
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
}