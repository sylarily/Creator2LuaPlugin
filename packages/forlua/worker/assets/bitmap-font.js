/* example = {
  "__type__": "cc.BitmapFont",
  "_name": "combo-text",
  "_objFlags": 0,
  "_rawFiles": null,
  "fntDataStr": "",
  "spriteFrame": { "__uuid__": "9ce3c6aa-dc66-4da1-a204-355ff496a79c" },
  "fontSize": 48,
  "_fntConfig": { ... }
} */

const fs = require("fs");
const parseUtils = require('../parse-utils');

module.exports = function (library, asset) {
    if (asset.markused) return asset.uri;

    let mountpath = Editor.remote.assetdb.mountInfoByUuid(asset.uuid).path;
    let data = JSON.parse(fs.readFileSync(asset.path));
    
    parseUtils.parseAsset(library, data.spriteFrame);

    asset.fullpath = Editor.remote.assetdb.uuidToFspath(asset.uuid);
    asset.uri = asset.fullpath.substr(mountpath.length + 1);
    asset.markused = true;

    return asset.uri;
}