/* example = {
    "__type__": "cc.Texture2D",
    "content": "0,9729,9729,33071,33071,0"
} */

module.exports = function (library, asset) {
    if (asset.markused) return asset.uri;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;

    asset.fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);
    asset.uri = asset.fullpath.substr(mountpath.length + 1);
    asset.markused = true;

    return asset.uri;
}