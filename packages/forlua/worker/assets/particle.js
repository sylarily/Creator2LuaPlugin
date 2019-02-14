/* example = {
    "__type__": "cc.ParticleAsset",
    "_name": "dinamite",
    "_objFlags": 0,
    "_native": ".plist",
    "texture": {
      "__uuid__": "b9d7a0a3-b9ac-4613-a7c6-30424491120f"
    }
} */

const parseUtils = require('../parse-utils');

module.exports = function (library, asset) {
    if (asset.markused) return asset.uri;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;

    asset.fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);
    asset.uri = asset.fullpath.substr(mountpath.length + 1);
    asset.markused = true;

    let textureFullpath = asset.fullpath.substr(0, asset.fullpath.length - 6) + '.png';
    let textureUuid = Editor.remote.assetdb.fspathToUuid(textureFullpath);
    if (textureUuid != null && textureUuid != "") {
        parseUtils.parseAsset(library, { __uuid__: textureUuid });
    }

    return asset.uri;
}