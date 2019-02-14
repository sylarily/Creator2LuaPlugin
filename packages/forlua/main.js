const path = require('path');

let env = {};

module.exports = {
    load() {
        env.pname = 'forlua'; 
        env.pinfo = Editor.Package.packageInfo(Editor.Package.packagePath('forlua'));
        env.profile = Editor.Profile.load('profile://project/forlua.json');
        env.workerUrl = 'packages://forlua/worker/worker';

        env.projectDir = Editor.projectInfo.path;
        env.assetsDir = path.join(env.projectDir, 'assets');
        env.resourcesDir = path.join(env.assetsDir, "resources");
        env.outputDir = path.join(env.projectDir, "gamebox.app", "Contents", "Resources", "res");
    },

    unload() {
    },

    messages: {
        'build-and-copy-assets' (event, params) {
            params = params || {}
            params.copyAssets = true;

            Editor.App.spawnWorker(env.workerUrl, (worker) => {
                worker.send("forlua:build", env, params, (error, result) => {
                }, -1);
            }, true);
        },

        'build' (event, params) {
            params = params || {}

            Editor.App.spawnWorker(env.workerUrl, (worker) => {
                worker.send("forlua:build", env, params, (error, result) => {
                }, -1);
            }, true);
        },

        'settings' () {
            Editor.log('[forlua] version ' + env.pinfo.version);

            // Editor.Panel.open(env.pname);
        },
    }
};

