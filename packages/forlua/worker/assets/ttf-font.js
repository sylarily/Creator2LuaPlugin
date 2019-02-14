/* example = {
    "__type__": "cc.TTFFont",
    "_name": "smdg",
    "_objFlags": 0,
    "_rawFiles": [ "smdg.ttf" ]
} */

module.exports = function (library, asset) {
    if (asset.markused) return asset.uri;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;

    asset.fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);
    asset.uri = asset.fullpath.substr(mountpath.length + 1);
    asset.markused = true;

    return asset.uri;
}