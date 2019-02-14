let luaprinter = {};

let ignorelf = [ "id", "name", "size", "anchor", "scale", "rotationx", "rotationy", "skewx", "opacity" ];

let isSimpleValue = function (value) {
    let t = typeof(value);
    return value == null || t == 'undefined' || t == 'boolean' || t == 'number' || t == "string";
}

luaprinter.toLuaTable = function (obj, indent) {
    let t = typeof(obj);

    if (obj == null) return 'nil';
    if (t   == 'undefined') return 'nil';
    if (t   == 'boolean') return obj ? 'true' : 'false';
    if (t   == 'number') return obj.toString();

    if (t   == 'string') {
        return '"' + obj.replace(/\"/g, '\\"').replace(/\n/g, '\\n') + '"'
    }

    let indent2 = indent + '\t';
    let isarr = (obj instanceof Array);
    let oneline = (isarr ? obj.every(isSimpleValue) : obj._oneline);
    let res = (oneline ? '{' : '{\n');

    if (isarr) {
        obj.forEach((value, i)=>{
            if (!oneline) res += indent+'['+(i+1)+']=';
            res += luaprinter.toLuaTable(value, indent);
            if (i < obj.length - 1) res += ',';
            if (!oneline) res += '\n';
        });
    }
    else {
        let denyIndent = false;
        for (let key in obj) {
            if (key[ 0 ] == '_') continue;
            if (!oneline && !denyIndent) res += indent2;

            denyIndent = false;
            res += key+'='+luaprinter.toLuaTable(obj[ key ], indent2)+',';

            if (!oneline && ignorelf.indexOf(key) == -1) {
                res += '\n';
            } else {
                denyIndent = true;
            }
        }
    }

    res += (oneline ? '}' : indent+'}');
    return res;
}

module.exports = luaprinter;