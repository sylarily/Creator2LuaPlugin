const fire_fs = require('fire-fs');
const fs = require('fs');
const path = require('path');

let utils = {};

let getLibrary = function (succ) {
    Editor.remote.assetdb.queryMetas('db://**/*', '', (err, metas) => {    
        console.log('--------', 'process library', '--------');

        let library = {};
        let types = {};

        for (let i = 0, len = metas.length; i < len; ++i) {
            let meta = metas[ i ];
            let info = {}

            info.uuid = meta.uuid;
            info.type = meta.assetType();
            info.raw = meta.useRawfile();
            info.path = null; // 资源的大概位置（对于非raw assets的资源，其值是一个json描述文件，所以叫作资源的大概位置）
            info.markused = false; // 资源是否被使用到了
            info.fullpath = null; // 资源的实际位置（为null时表示此资源没有实际对应的文件，不需要复制到导出目录，如单个sprite-frame。还有的资源有特殊的导出过程，此时fullpath也为null）
            info.uri = null; // 资源导出后的相对路径（资源被使用时，怎么去访问到这个资源）
            info.detail = {}; // 有时候资源的uri不能完全描述怎么访问资源，此时用个detail来记录，比如spine动画资源实际需要json,atlas,texture三种资源组合使用

            library[ info.uuid ] = info;
            types[ info.type ] = info;

            if (info.raw) {
                info.path = Editor.remote.assetdb.uuidToFspath(info.uuid);
            }
            else {
                info.path = Editor.remote.assetdb._uuidToImportPathNoExt(info.uuid) + '.json';
            }

            info.path = info.path.replace(/\\/g, '/');
        }

        for (let type in types) {
            console.log(type+':', types[ type ].path, "is raw:", types[ type ].raw);
        }

        succ(library);
    });
}

utils.getLibrary = function () {
    return new Promise(getLibrary);
}

utils.getFiles = function (dir, exts) {
    let result = [];
    let files = fs.readdirSync(dir);

    files.forEach((file) => {
        let fullpath = path.join(dir, file)
        let fileext = path.extname(file);
        let stats = fs.lstatSync(fullpath);
        
        if (exts.includes(fileext)) {
            result.push(fullpath);
        }

        if (stats.isDirectory()) {
            result = result.concat(utils.getFiles(fullpath, exts));
        }
    });

    return result;
}

utils.exportScene = function (root, outputDir, uri) {
    console.log('--------', "export scene", uri, '--------');
    
    let text = require('./luaprinter').toLuaTable(root, '');
    text = "return " + text;

    fire_fs.ensureDirSync(path.join(outputDir, path.dirname(uri)));
    let file = fs.openSync(path.join(outputDir, uri), 'w');
    fs.writeSync(file, text);
    fs.close(file);
}

utils.exportLibrary = function (library, outputDir) {
    console.log('--------', "export library", '--------');

    for (let k in library) {
        let asset = library[ k ];
        if (asset.markused && asset.fullpath != null) {
            console.log("copy", asset.fullpath, asset.uri);
            let outputPath = path.join(outputDir, asset.uri);
            fire_fs.ensureDirSync(path.dirname(outputPath));
            fire_fs.copySync(asset.fullpath, outputPath);
        }
    }
}

module.exports = utils;