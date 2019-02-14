/* example = {
    "_enabled": true,
    "_isSystemFontUsed": false,
    "_N$fontFamily": "Arial",
    "_N$file": { "__uuid__": "1de856f8-992b-46d6-b31e-e51ff9da2d56" },
    "_string": "Label",
    "_N$string": "Label",
    "_fontSize": 40,
    "_lineHeight": 40,
    "_N$horizontalAlign": 0,
    "_N$verticalAlign": 0,
    "_N$overflow": 0,
    "_enableWrapText": true,
    "_spacingX": 0,
    "_useOriginalSize": false,

    "_srcBlendFactor": 1,
    "_dstBlendFactor": 771,
    "_id": "feHt07dldN8qI8y+EhzU2P"
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {  
    com.enabled         = parseUtils.transValue(comdata, '_enabled');
    com.systemFont      = parseUtils.transValue(comdata, '_isSystemFontUsed');
    com.fontFamily      = parseUtils.transValue(comdata, '_N$fontFamily');
    com.font            = parseUtils.parseAsset(library, comdata[ '_N$file' ]);
    com.string          = parseUtils.transValue(comdata, '_N$string');
    com.fontSize        = parseUtils.transValue(comdata, '_fontSize');
    com.lineHeight      = parseUtils.transValue(comdata, '_lineHeight');
    com.halign          = parseUtils.transValue(comdata, '_N$horizontalAlign');
    com.valign          = parseUtils.transValue(comdata, '_N$verticalAlign');
    com.overflow        = parseUtils.transValue(comdata, '_N$overflow');
    com.enableWrapText  = parseUtils.transValue(comdata, '_enableWrapText');
    com.useOriginalSize = parseUtils.transValue(comdata, '_useOriginalSize');
    com.spacingX        = parseUtils.transValue(comdata, '_spacingX');
}