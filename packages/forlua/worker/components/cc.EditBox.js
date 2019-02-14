/* example = {
    "_enabled": true,
    "_string": "editbox",
    "_N$fontSize": 20,
    "_N$fontColor": { "__type__": "cc.Color", "r": 255, "g": 255, "b": 255, "a": 255 },
    "_N$placeholder": "Enter text here...",
    "_N$placeholderFontSize": 20,
    "_N$placeholderFontColor": { "__type__": "cc.Color", "r": 127, "g": 127, "b": 127, "a": 255 },
    "_N$backgroundImage": { "__uuid__": "31bc895a-c003-4566-a9f3-2e54ae1c17dc" },
    "_N$maxLength": 20,
    "_N$returnType": 0,
    "_N$inputFlag": 5,
    "_N$inputMode": 0,
    "_N$lineHeight": 40,
    "_tabIndex": 0,
    "_N$stayOnTop": false,

    "_useOriginalSize": false,    
    "editingDidBegan": [],
    "textChanged": [],
    "editingDidEnded": [],
    "editingReturn": [],
    "_id": "87IOILSjZIpZ3uedMUaeCi"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {  
    com.enabled         = parseUtils.transValue(comdata, '_enabled');
    com.string          = parseUtils.transValue(comdata, '_string');
    com.fontSize        = parseUtils.transValue(comdata, '_N$fontSize');
    com.fontColor       = parseUtils.transColor(comdata, '_N$fontColor');
    com.placeholder     = parseUtils.transValue(comdata, '_N$placeholder');
    com.placeFontSize   = parseUtils.transValue(comdata, '_N$placeholderFontSize');
    com.placeFontColor  = parseUtils.transColor(comdata, '_N$placeholderFontColor');
    com.backgroundImage = parseUtils.parseAsset(library, comdata[ '_N$backgroundImage' ]);    
    com.maxLength       = parseUtils.transValue(comdata, '_N$maxLength');
    com.returnType      = parseUtils.transValue(comdata, '_N$returnType');
    com.inputFlag       = parseUtils.transValue(comdata, '_N$inputFlag');
    com.inputMode       = parseUtils.transValue(comdata, '_N$inputMode');
    com.lineHeight      = parseUtils.transValue(comdata, '_N$lineHeight');
    com.tabIndex        = parseUtils.transValue(comdata, '_tabIndex');
    com.stayOnTop       = parseUtils.transValue(comdata, '_N$stayOnTop');
}