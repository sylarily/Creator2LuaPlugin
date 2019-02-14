cclua = {}

-- c++层依赖的lua层的东西
__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 3)
    print(msg)
    return msg
end

-- 单例对象的便捷访问
cclua.director = cc.Director:getInstance()
cclua.glview = cclua.director:getOpenGLView()
cclua.textureCache = cclua.director:getTextureCache()
cclua.sfCache = cc.SpriteFrameCache:getInstance()
cclua.fileUtils = cc.FileUtils:getInstance()
cclua.scene = nil -- 当调用cclua.start的时候，才会创建并且设置

-- Node的便捷创建
cclua.newScene = function ()
    return cc.Scene:create()
end

cclua.newNode = function ()
    return cc.Node:create()
end

cclua.newSprite = function ()
    return cc.Sprite:create()
end

cclua.newMask = function ()
    return cc.ClippingNode:create()
end

cclua.newSpineAnim = function (jsonFile, atlasFile, timeScale)
    return sp.SkeletonAnimation:createWithJsonFile(jsonFile, atlasFile, timeScale)
end

cclua.newParticle = function (particleFilename)
    return cc.ParticleSystemQuad:create(particleFilename)
end

cclua.newSystemLabel = function (fontFamily, fontSize, text)
    return cc.Label:createWithSystemFont(text, fontFamily, fontSize)
end

cclua.newLabel = function(fontPath, fontSize, text, spacingx)
    local label
    local fontType = fontPath:match(".+%.(%w+)$")
    if string.lower(fontType) == "ttf" then
        label = cc.Label:createWithTTF(text, fontPath, fontSize)
    elseif string.lower(fontType) == "fnt" then
        label = cc.Label:createWithBMFont(fontPath, text)
        label:setBMFontSize(fontSize)
        label:setAdditionalKerning(spacingx or 0)
    end
    return label
end

cclua.newEditBox = function(size, normalSprite, pressedSprite, disableSprite)
    return ccui.EditBox:create(size, normalSprite, pressedSprite, disableSprite)
end

-- cclua 提供的流程控制方法
cclua.start = function (fun)
    math.randomseed(os.time())
    cclua.fileUtils:setPopupNotify(false)

    local scene = cclua.newScene()
    cclua.director:runWithScene(scene)

    cclua.scene = scene

    xpcall(fun, __G__TRACKBACK__)
end