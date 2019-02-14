let parseUtils = {};

parseUtils.transValue = function (data, name) {
    if (!(name in data)) return null;
    return data[name];
}

parseUtils.transVec2 = function (data, name) {
    if (!(name in data)) return null;
    let v = { x:data[name].x, y:data[name].y };
    v._oneline = true;
    return v;
}

parseUtils.transVec2Flat = function (data, name) {
    if (!(name in data)) return null;
    let v = { x:data[name][0], y:data[name][1] };
    v._oneline = true;
    return v;
}

parseUtils.transSize = function (data, name) {
    if (!(name in data)) return null;
    let v ={ width:data[name].width, height:data[name].height };
    v._oneline = true;
    return v;
}

parseUtils.transSizeFlat = function (data, name) {
    if (!(name in data)) return null;
    let v = { width:data[name][0], height:data[name][1] };
    v._oneline = true;
    return v;
}

parseUtils.transRect = function (data, name) {
    if (!(name in data)) return null;
    let v = { x:data[name].x, y:data[name].y, width:data[name].width, height:data[name].height };
    v._oneline = true;
    return v;
}

parseUtils.transRectFlat = function (data, name) {
    if (!(name in data)) return null;
    let v = { x:data[name][0], y:data[name][1], width:data[name][2], height:data[name][3] };
    v._oneline = true;
    return v;
}

parseUtils.transColor = function (data, name) {
    if (!(name in data)) return null;
    let color = data[ name ];
    let v = { r:color.r, g:color.g, b:color.b };
    v._oneline = true;
    return v;
}

parseUtils.transNode = function (data, name, domdata) {
    if (!(name in data)) return null;
    if (data[ name ] == null) return null;

    let id = data[ name ].__id__;
    let v;
    if (domdata[ id ].__type__ == "cc.Node") {
        v = { id: id, type: "cc.Node" };
    } else {
        v = { id: domdata[ id ].node.__id__, type: domdata[ id ].__type__ };
    }
    v._oneline = true;
    return v;
}

let parseComponent = function (library, domdata, id) {
    let comdata = domdata[ id ];
    let comtype = comdata.__type__;

    try {
        let comparser = require('./components/'+comtype);
        let com = { id: id, type: comtype };
        comparser(com, library, domdata, comdata);
        return com;
    }
    catch (error) {
        console.log('unsupported component', comtype, error);
        return null;
    }
}

let parseComponents = function (library, domdata, node, nodedata) {
    if (!('_components' in nodedata)) return true;
    if (nodedata._components.length == 0) return true;

    for (let i = 0; i < nodedata._components.length; ++i) {
        let comid = nodedata._components[ i ].__id__;
        if (domdata[ comid ].__type__ == "cc.Camera") {
            return false;
        }
    }

    node.components = [];

    for (let i = 0; i < nodedata._components.length; ++i) {
        let comid = nodedata._components[ i ].__id__;
        let com = parseComponent(library, domdata, comid);
        if (com) node.components.push(com);
    }

    return true;
}

let parseChildren = function (library, domdata, node, nodedata) {
    if (!('_children' in nodedata)) return;
    if (nodedata._children.length == 0) return;

    node.children = [];

    for (let i = 0; i < nodedata._children.length; ++i) {
        let childid = nodedata._children[ i ].__id__;
        let child = parseUtils.parseNode(library, domdata, childid);
        if (child) node.children.push(child);
    }
}

parseUtils.parseNode = function (library, domdata, id, onlychildren) {
    let node = {};
    let nodedata = domdata[ id ];

    if (!onlychildren) {
        node.id        = id;
        node.name      = parseUtils.transValue(nodedata, '_name');
        node.active    = parseUtils.transValue(nodedata, '_active');
        node.size      = parseUtils.transSize (nodedata, '_contentSize');
        node.anchor    = parseUtils.transVec2 (nodedata, '_anchorPoint');
        node.position  = parseUtils.transVec2 (nodedata, '_position');
        node.scale     = parseUtils.transVec2 (nodedata, '_scale');
        node.rotationx = parseUtils.transValue(nodedata, '_rotationX');
        node.rotationy = parseUtils.transValue(nodedata, '_rotationY');
        node.skewx     = parseUtils.transValue(nodedata, '_skewX');
        node.skewy     = parseUtils.transValue(nodedata, '_skewY');
        node.opacity   = parseUtils.transValue(nodedata, '_opacity');
        node.color     = parseUtils.transColor(nodedata, '_color');

        let noInvalidComponent = parseComponents(library, domdata, node, nodedata);

        if (!noInvalidComponent) return null;
    }

    parseChildren(library, domdata, node, nodedata);

    return node;
}

parseUtils.parseAsset = function (library, assetRef) {
    if (assetRef == null) return null;

    let uuid = assetRef.__uuid__;
    let asset = library[ uuid ];    

    try {
        let processer = require("./assets/" + asset.type);
        let ret = processer(library, asset);
        return ret
    } 
    catch (error) {
        console.log("unsupported asset type:", asset.type, error);
        return null;
    }
}

module.exports = parseUtils;