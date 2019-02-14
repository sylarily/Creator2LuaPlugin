const fs = require('fs');
const path = require('path');
const electron = require('electron');

Editor.Panel.extend({
    style: '',
    template: '<h1>todo</h1>',

    ready () {
        let profile = this.profiles.project;
    },
});

