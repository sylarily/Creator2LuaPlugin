creator = {}

creator.const = require("packages.creator.const")
creator.utils = require("packages.creator.utils")
creator.assetUtils = require("packages.creator.asset-utils")
creator.Widget = require("packages.creator.extends.Widget")
creator.Button = require("packages.creator.extends.Button")
creator.Toggle = require("packages.creator.extends.Toggle")
creator.ToggleGroup = require("packages.creator.extends.ToggleGroup")
creator.ScrollView = require("packages.creator.extends.ScrollView")
creator.ScrollBar = require("packages.creator.extends.ScrollBar")

local nodesTable = require("packages.creator.nodes")
local extendsTable = require("packages.creator.extends")

local function createNode (dom)
    local node

    for i, com in ipairs(dom.components or {}) do
        local f = nodesTable[ com.type ]
        if f ~= nil then
            node = f(dom, com)
            break
        end
    end

    if node == nil then
        node = nodesTable[ "cc.Node" ](dom)
    end

    return node
end

local function createNodeTree (dom, idmap, namemap)
    local node = createNode(dom)
    
    if dom.id then
        idmap[ dom.id ] = node
    end

    if creator.utils.getIdentifierFromStr(dom.name, "%$") ~= nil then
        namemap[ creator.utils.getIdentifierFromStr(dom.name, "%$") ] = node
    end

    if dom.children then
        for k, v in ipairs(dom.children) do
            if dom.size ~= nil then 
                v.position.x = v.position.x + dom.size.width * dom.anchor.x
                v.position.y = v.position.y + dom.size.height * dom.anchor.y
            end
            local child = createNodeTree(v, idmap, namemap)
            node:addChild(child)
        end
    end

    return node
end

local function equipExtends (priority, dom, node, idmap, eventmap)
    if not dom then return end

    local eventname = nil
    if creator.utils.getIdentifierFromStr(dom.name, "#") ~= nil then
        eventname = creator.utils.getIdentifierFromStr(dom.name, "#")
    end

    for _, com in ipairs(dom.components or {}) do
        local extend = extendsTable[ com.type ]
        if extend ~= nil and extend.priority == priority then
            local ui = extend.fun(node, com, idmap)
            if eventname ~= nil then eventmap[ ui ] = eventname end
            node.creator = node.creator or {}
            node.creator[ #node.creator + 1 ] = ui
        end
    end

    for i, child in ipairs(node:getChildren()) do
        equipExtends(priority, dom.children[ i ], child, idmap, eventmap)
    end

    return eventmap
end

creator.create = function (dom)
    local idmap = {}
    local namemap = {}
    local root = createNodeTree(dom, idmap, namemap)

    local eventmap = {}    
    equipExtends(creator.const.ExtendPriority_High, dom, root, idmap, eventmap)
    equipExtends(creator.const.ExtendPriority_Normal, dom, root, idmap, eventmap)
    equipExtends(creator.const.ExtendPriority_Low, dom, root, idmap, eventmap)

    return root, namemap, eventmap
end