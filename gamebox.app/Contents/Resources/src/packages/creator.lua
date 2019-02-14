-- cocos2dx本身的问题:
--   cocos2dx子结点所在坐标系的原点是父结点左下角, 而不是父结点的锚点;
--   cocos2dx的九宫图在原图大小超过使用大小时, 会显示异常;
--   cocos2dx的Label的描边只能在Android或iOS下生效;
--   cocos2dx的Label的lineHeight是开玩笑的;
--   cocos2dx的EditBox的lineHeight也是无效的;
--   cocos2dx的EditBox里内置的两个label, 固定为SystemFont;
-- lua解析时的特殊处理:
--   使用了sp.Skeleton组件的结点, 解析后size的长宽会变成0;
--   使用了cc.ParticleSystem组件的结点, 解析后size的长宽会变成0;
--   cc.ParticleSystem组件没有设置file属性时, 会报错或崩溃;
--   cc.ParticleSystem组件进行过custom的话, 不会产生效果, 仍然以粒子对应的plist文件为准;
--   解析时把cc.EditBox也看成了渲染组件;
-- CocosCreator中用了cc.EditBox时, 请特别注意:
--   在CocosCreator中使用了cc.EditBox, 会产生2个拥有cc.Label的结点,
--   请保证这两个cc.Label结点一直存在, 并且为cc.EditBox结点的直接子结点,
--   请保证这两个cc.Label结点的上下顺序不变,
--   请保证cc.EditBox结点的直接子结点中, 其它拥有cc.Label的结点不能比这两个结点更上面,
--   以上三条在创建cc.EditBox时都是满足的, 去调整cc.EditBox时, 请保证别破坏了上面的三点.

creator = {}

creator.const = require("packages.creator.const")
creator.utils = require("packages.creator.utils")
creator.assetUtils = require("packages.creator.asset-utils")
creator.Widget = require("packages.creator.extends.Widget")
creator.Layout = require("packages.creator.extends.Layout")
creator.Button = require("packages.creator.extends.Button")
creator.Toggle = require("packages.creator.extends.Toggle")
creator.ToggleGroup = require("packages.creator.extends.ToggleGroup")
creator.ScrollView = require("packages.creator.extends.ScrollView")
creator.ScrollBar = require("packages.creator.extends.ScrollBar")
creator.RichText = require("packages.creator.extends.RichText")

local nodesTable = require("packages.creator.nodes")
local extendsTable = require("packages.creator.extends")

local function getNodeTable (dom)
    for _, component in ipairs(dom.components or {}) do
        local f = nodesTable[ component.type ]
        if f ~= nil then 
            return f, component 
        end
    end

    return nodesTable[ "cc.Node" ], nil
end

local function createNodeTree (dom, parentDom, idmap, namemap, parentPrecreated)
    local nodeTable, com, precreated, node, precreatedChildren

    if parentPrecreated ~= nil and #parentPrecreated > 0 then
        if parentPrecreated[ 1 ] == "cc.Node" then
            nodeTable, com = nodesTable[ "cc.Node" ], nil
            precreated, node = true, parentPrecreated[ 2 ]
        else
            for _, component in ipairs(dom.components or {}) do
                if parentPrecreated[ 1 ] == component.type then
                    nodeTable, com = nodesTable[ component.type ], component
                    precreated, node = true, parentPrecreated[ 2 ]
                    break
                end
            end
        end
    end

    if precreated then
        table.remove(parentPrecreated, 1)
        table.remove(parentPrecreated, 1)
    else
        nodeTable, com = getNodeTable(dom)
        node, precreatedChildren = nodeTable.create(dom, com)
    end
    
    if dom.id then
        idmap[ dom.id ] = node
    end

    if creator.utils.getIdentifierFromStr(dom.name, "%$") ~= nil then
        namemap[ creator.utils.getIdentifierFromStr(dom.name, "%$") ] = node
    end

    if parentDom and parentDom.size ~= nil then 
        local x = dom.position.x + parentDom.size.width * parentDom.anchor.x
        local y = dom.position.y + parentDom.size.height * parentDom.anchor.y
        node:setPosition(x, y)
    elseif dom.position ~= nil then
        node:setPosition(dom.position)
    end

    if dom.anchor ~= nil then node:setAnchorPoint(dom.anchor) end
    if dom.scale ~= nil then node:setScaleX(dom.scale.x) end
    if dom.scale ~= nil then node:setScaleY(dom.scale.y) end
    if dom.rotationx ~= nil then node:setRotationSkewX(dom.rotationx) end
    if dom.rotationy ~= nil then node:setRotationSkewY(dom.rotationy) end
    if dom.skewx ~= nil then node:setSkewX(dom.skewx) end
    if dom.skewy ~= nil then node:setSkewY(dom.skewy) end
    if dom.opaciy ~= nil then node:setOpacity(math.floor(dom.opacity)) end
    if dom.color ~= nil then node:setColor(dom.color) end
    if dom.size ~= nil then node:setContentSize(dom.size) end

    nodeTable.adjust(dom, com, node)

    if dom.children then
        for k, v in ipairs(dom.children) do
            local child, precreatedChild = createNodeTree(v, dom, idmap, namemap, precreatedChildren)
            if precreatedChild then
                child:setLocalZOrder(-1)
                child:setLocalZOrder(0)
            else
                node:addChild(child) 
            end
        end
    end

    return node, precreated
end

local function equipExtends (priority, dom, node, idmap, eventmap)
    local eventname = nil
    if creator.utils.getIdentifierFromStr(dom.name, "#") ~= nil then
        eventname = creator.utils.getIdentifierFromStr(dom.name, "#")
    end

    for _, component in ipairs(dom.components or {}) do
        local extend = extendsTable[ component.type ]
        if extend ~= nil and extend.priority == priority then
            local ui = extend.fun(node, component, idmap)
            if eventname ~= nil then eventmap[ ui ] = eventname end
            node.creator = node.creator or {}
            node.creator[ #node.creator + 1 ] = ui
        end
    end

    for i, child in ipairs(node:getChildren()) do
        if dom.children[ i ] ~= nil then
            equipExtends(priority, dom.children[ i ], child, idmap, eventmap)
        end
    end

    return eventmap
end

creator.create = function (dom)
    local idmap = {}
    local namemap = {}
    local root = createNodeTree(dom, nil, idmap, namemap, nil)

    local eventmap = {}    
    equipExtends(creator.const.ExtendPriority_High, dom, root, idmap, eventmap)
    equipExtends(creator.const.ExtendPriority_Normal, dom, root, idmap, eventmap)
    equipExtends(creator.const.ExtendPriority_Low, dom, root, idmap, eventmap)

    return root, namemap, eventmap
end