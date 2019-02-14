/* example = {
    "__type__": "sp.SkeletonData",
    "_name": "sprite-lantern-deng",
    "_objFlags": 0,
    "_rawFiles": [ "raw-skeleton.json" ],
    "_skeletonJson": { ... },
    "_atlasText": "...",
    "textures": [
      { "__uuid__": "d1af1e86-737c-4910-8933-98bd3f214273" }
    ],
    "scale": 1
} */

const fs = require('fs');
const parseUtils = require('../parse-utils');

module.exports = function (library, asset) {
    if (asset.markused) return asset.detail;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;
    let data = JSON.parse(fs.readFileSync(asset.path));

    asset.fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);
    asset.uri = asset.fullpath.substr(mountpath.length + 1);
    asset.detail.type = asset.type;
    asset.detail.json = asset.uri;
    asset.detail.atlas = asset.uri.substr(0, asset.uri.length - 5) + '.atlas';
    asset.markused = true;

    let atlasFullpath = asset.fullpath.substr(0, asset.fullpath.length - 5) + '.atlas';
    let atlasUuid = Editor.remote.assetdb.fspathToUuid(atlasFullpath);
    parseUtils.parseAsset(library, { __uuid__: atlasUuid });

    data.textures.forEach((textureRef) => parseUtils.parseAsset(library, textureRef));

    return asset.detail;
}