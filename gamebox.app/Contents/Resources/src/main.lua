require("packages.cocos")
require("packages.cclua")
require("packages.creator")

local function bootstrap ()
    cclua.glview:setDesignResolutionSize(960, 640, cocos.ResolutionPolicy_ExtraFit)
    
    local root, namemap, eventmap = creator.create(require("entry2"))

    cclua.scene:addChild(root)

    for name, node in pairs(namemap) do
        print("named node:", name, node)
        node:runAction(cc.RotateBy:create(10, 7200))
    end

    for ui, eventname in pairs(eventmap) do
        print("event:", eventname, ui)
        ui.callback = function () print(eventname) end
    end
end

cclua.start(bootstrap)