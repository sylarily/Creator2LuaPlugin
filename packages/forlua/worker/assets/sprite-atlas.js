/* example = {
    "__type__": "cc.SpriteAtlas",
    "_name": "enemies.plist",
    "_objFlags": 0,
    "_rawFiles": null,
    "_spriteFrames": {
        "b-arm-bat": { "__uuid__": "61e31089-5d2b-499a-b3ec-b988cb45120b" },
        ...
    }
} */

const fs = require('fs');
const parseUtils = require('../parse-utils');

module.exports = function (library, asset) {
    if (asset.markused) return asset.detail;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;
    let data = JSON.parse(fs.readFileSync(asset.path));
    let fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);

    asset.fullpath = null;
    asset.uri = fullpath.substr(mountpath.length + 1);
    asset.detail.type = asset.type;
    asset.detail.spriteFrames = [];
    for (let key in data._spriteFrames) {
        let sfRef = data._spriteFrames[ key ];
        asset.detail.spriteFrames.push(parseUtils.parseAsset(library, sfRef))
    }
    asset.markused = true;

    return asset.detail;
}