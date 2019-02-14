/* example = {
    "_enabled": true,
    "content": { "__id__": 27 },
    "horizontal": false,
    "vertical": true,
    "inertia": true,
    "brake": 0.75,
    "elastic": true,
    "bounceDuration": 0.23,
    "_N$horizontalScrollBar": null,
    "_N$verticalScrollBar": { "__id__": 25 },

    "cancelInnerEvents": true,
    "scrollEvents": [],
    "_id": "c0qGHYkilAJY9yMBkuDkB0"
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
    com.horizontalScrollBar = parseUtils.transNode (comdata, '_N$horizontalScrollBar', domdata);
    com.verticalScrollBar   = parseUtils.transNode (comdata, '_N$verticalScrollBar"', domdata);
}