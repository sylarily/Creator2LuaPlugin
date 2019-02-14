const fs = require('fs');
const del = require('del');
const path = require('path');
const electron = require('electron');
const utils = require('./utils');
const parseUtils = require('./parse-utils');

let exec = function (event, env, params) {
    console.log('********', 'begin, please wait until done. params:', params, '********');

    utils.getLibrary().then((library) => {
        if (params.copyAssets) {
            del.sync(env.outputDir, { force: true })
        }

        let fires = utils.getFiles(env.assetsDir, [ '.fire' ]);
        
        fires.forEach((firepath) => {
            let domdata = JSON.parse(fs.readFileSync(firepath));
            let rootid = domdata[ 0 ].scene.__id__;
            let root = parseUtils.parseNode(library, domdata, rootid, true);
            let uri = path.basename(firepath.substr(env.assetsDir.length + 1), ".fire") + ".lua";
            utils.exportScene(root, env.outputDir, uri);
        });
        
        if (params.copyAssets) {
            utils.exportLibrary(library, env.outputDir);
        }

        console.log('********', 'done!', '********');
        event.reply(null /* error */, null /* result */);
    });
}

electron.ipcRenderer.on('forlua:build', exec);