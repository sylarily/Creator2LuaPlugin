/* example = {
    "__type__": "cc.SpriteFrame",
    "content": {
      "name": "tag-new",
      "texture": "63001a4b-ad33-4448-a70a-cbfd9c5046cb",
      "atlas": "fbe65d6d-aac1-4ad2-b80a-e73a3ef76f34",
      "rect": [ 979, 299, 69, 44 ],
      "offset": [ 0, 0 ],
      "originalSize": [ 69, 44 ],
      "capInsets": [ 11, 11, 10, 9 ],
      "rotated": 1
    }
} */

const fs = require('fs');
const path = require('path');
const parseUtils = require('../parse-utils');

module.exports = function (library, asset) {
    if (asset.markused) return asset.detail;

    let data = JSON.parse(fs.readFileSync(asset.path)).content;
    
    asset.fullpath = null;
    asset.uri = null;
    asset.detail.type = asset.type;
    asset.detail.texture = parseUtils.parseAsset(library, { __uuid__: data.texture });
    asset.detail.uri = path.basename(asset.detail.texture) + "/" + data.name;
    asset.detail.rect = parseUtils.transRectFlat(data, "rect");
    asset.detail.offset = parseUtils.transVec2Flat(data, "offset");
    asset.detail.originalSize = parseUtils.transSizeFlat(data, "originalSize");
    asset.detail.capInsets = parseUtils.transRectFlat(data, "capInsets");
    asset.detail.rotated = data.rotated;
    asset.markused = true;

    return asset.detail;
}