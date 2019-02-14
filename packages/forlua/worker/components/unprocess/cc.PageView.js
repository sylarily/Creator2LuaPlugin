/* example = {
    "_enabled": true,
    "content": { "__id__": 39 },
    "horizontal": true,
    "vertical": true,
    "inertia": true,
    "brake": 0.5,
    "elastic": true,
    "bounceDuration": 0.5,
    "cancelInnerEvents": true,
    "scrollThreshold": 0.5,
    "autoPageTurningThreshold": 100,
    "pageTurningEventTiming": 0.1,
    "pageTurningSpeed": 0.3,
    "_N$sizeMode": 0,
    "_N$direction": 0,
    "_N$indicator": { "__id__": 49 }

    "scrollEvents": [],
    "pageEvents": [],
} */

const parseUtils = require('../parse-utils');

module.exports = function (com, library, domdata, comdata) {
    com.enabled             = parseUtils.transValue(comdata, '_enabled');
    com.content             = parseUtils.transNode (comdata, 'content', domdata);
    com.horizontal          = parseUtils.transValue(comdata, 'horizontal');
    com.vertical            = parseUtils.transValue(comdata, 'vertical');
    com.inertia             = parseUtils.transValue(comdata, 'inertia');
    com.brake               = parseUtils.transValue(comdata, 'brake');
    com.elastic             = parseUtils.transValue(comdata, 'elastic');
    com.bounceDuration      = parseUtils.transValue(comdata, 'bounceDuration');
    com.cancelInnerEvents   = parseUtils.transValue(comdata, 'cancelInnerEvents');
    com.scrollThreshold     = parseUtils.transValue(comdata, 'scrollThreshold');
    com.autoTurnThreshold   = parseUtils.transValue(comdata, 'autoPageTurningThreshold');
    com.pageTurnEventTiming = parseUtils.transValue(comdata, 'pageTurningEventTiming');
    com.pageTurningSpeed    = parseUtils.transValue(comdata, 'pageTurningSpeed');
    com.sizeMode            = parseUtils.transValue(comdata, '_N$sizeMode');
    com.direction           = parseUtils.transValue(comdata, '_N$direction');
    com.indicator           = parseUtils.transNode (comdata, '_N$indicator', domdata);
}