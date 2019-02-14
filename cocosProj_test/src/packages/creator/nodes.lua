local setBaseProperties = function (node, dom)
    if dom.anchor ~= nil    then node:setAnchorPoint(dom.anchor) end
    if dom.position ~= nil  then node:setPosition(dom.position) end
    if dom.scale ~= nil     then node:setScaleX(dom.scale.x) end
    if dom.scale ~= nil     then node:setScaleY(dom.scale.y) end
    if dom.rotationx ~= nil then node:setRotationSkewX(dom.rotationx) end
    if dom.rotationy ~= nil then node:setRotationSkewY(dom.rotationy) end
    if dom.skewx ~= nil     then node:setSkewX(dom.skewx) end
    if dom.skewy ~= nil     then node:setSkewY(dom.skewy) end
    if dom.opaciy ~= nil    then node:setOpacity(math.floor(dom.opacity)) end
    if dom.color ~= nil     then node:setColor(dom.color) end
    if dom.size ~= nil      then node:setContentSize(dom.size) end
end

local renderNodeCreators = {}

renderNodeCreators[ "cc.Node" ] = function (dom)
    local node = cclua.newNode()
    setBaseProperties(node, dom)
    return node
end

renderNodeCreators[ "cc.Sprite" ] = function (dom, com)
    local spr = cclua.newSprite()
    setBaseProperties(spr, dom)
    spr:setSpriteFrame(creator.assetUtils.createSpriteFrame(com.spriteFrame, com.trimmedMode))
    spr:setContentSize(dom.size)

    if com.renderType == creator.const.SpriteType_Simple then 
        spr:setCenterRectNormalized({ x=0, y=0, width=1, height=1 }) 
    end

    return spr
end

renderNodeCreators[ "cc.Mask" ] = function (dom, com)
    local node = cclua.newMask()
    setBaseProperties(node, dom)
    node:setInverted(com.inverted)
    
    local type = com.modeType
    if type == creator.const.MaskType_Rect then
        local size = node:getContentSize()
        local rectangle = {
            {x = 0, y = 0},
            {x = size.width, y = 0 },
            {x = size.width, y = size.height},
            {x = 0, y = size.height}
        }
        local stencil = cc.DrawNode:create()
        stencil:drawPolygon(rectangle, 4, cc.c4f(1, 1, 1, 1), 1, cc.c4f(1, 1, 1, 1))

        node:setStencil(stencil)

    elseif type == creator.const.MaskType_Ellipse then
        local size = node:getContentSize()
        local r = math.min(size.width, size.height) / 2
        local segments = com.segements
        local stencil = cc.DrawNode:create()
        stencil:drawSolidCircle(cc.vertex2F(r, r), r, math.pi * 2, segments, cc.c4f(1, 1, 1, 1))

        node:setStencil(stencil)

    elseif type == creator.const.MaskType_ImageSten then
        local alphaThreshold = com.alphaThreshold
        local spriteFrame = creator.assetUtils.createSpriteFrame(com.spriteFrame, true)
        local stencil = cclua.newSprite()
        stencil:setSpriteFrame(spriteFrame)
        stencil:setContentSize(node:getContentSize())
        stencil:setAnchorPoint({ x=0, y=0 })
        stencil:setCenterRectNormalized({ x=0, y=0, width=1, height=1 }) 

        node:setStencil(stencil)
        node:setAlphaThreshold(alphaThreshold)
    end
    
    return node
end

renderNodeCreators[ "sp.Skeleton" ] = function (dom, com)
    local spine = cclua.newSpineAnim(com.skeleton.json, com.skeleton.atlas, com.timeScale)
    setBaseProperties(spine, dom)

    spine:setSkin(com.defaultSkin)
    spine:setAnimation(0, com.defaultAnim, com.loop)
    spine:setDebugSlotsEnabled(com.debugSlots)
    spine:setDebugBonesEnabled(com.debugBones)

    spine:setContentSize({width=0, height=0})
    return spine
end

-- renderNodeCreators[ "cc.ParticleSystem" ] = function (dom, com)
--     local particle = cclua.newParticle(com.file)
--     setBaseProperties(particle, dom)

--     if not com.playOnLoad then particle:stop() end
--     particle:setAutoRemoveOnFinish(com.autoRemoveOnFinish)
--     particle:setBlendFunc({src=com.srcBlendFactor, dst=com.dstBlendFactor})
    
--     if com.spriteFrame ~= nil then
--         local texture = cclua.textureCache:addImage(com.spriteFrame.texture)
--         if texture then particle:setTextureWithRect(texture, com.spriteFrame.rect) end
--     end

--     particle:setContentSize({width=0, height=0})
--     return particle
-- end

renderNodeCreators[ "cc.Label" ] = function (dom, com)
    local text = com.string
    local fontSize = com.fontSize
    local useSystemFont = com.systemFont
    local fontFamily = com.fontFamily
    local fontPath = com.font or ""
    local label = cclua.newLabel(text, fontSize, useSystemFont, fontFamily, fontPath)
    setBaseProperties(label, dom)

    if not useSystemFont then
        label:setLineHeight(com.lineHeight)
    end
    label:setHorizontalAlignment(com.halign)
    label:setVerticalAlignment(com.valign)
    label:setOverflow(com.overflow)
    label:enableWrap(com.enableWrap)

    local fontType = fontPath:match(".+%.(%w+)$")
    if fontType and string.lower(fontType) == "fnt" then
        label:setAdditionalKerning(com.spacingX or 0)
    end

    local outline
    for i, data in ipairs(dom.components or {}) do
        if data.type == "cc.LabelOutline" then
            outline = data
            break
        end
    end
    
    if outline and outline.enabled then
        local color = outline.color
        label:enableOutline(cc.c4b(color.r, color.g, color.b, color.a or 255), outline.width)
    end
    return label
end

renderNodeCreators[ "cc.EditBox" ] = function (dom, com)
    local size = dom.size
    local spriteFrame = creator.assetUtils.createSpriteFrame(com.backgroundImage, true)
    local normalSprite = ccui.Scale9Sprite:createWithSpriteFrame(spriteFrame)
    local editBox = cclua.newEditBox(size, normalSprite)
    setBaseProperties(editBox, dom)

    -- local editBox = cclua.newEditBoxEx(size, com.backgroundImage.texture, 0)
    -- setBaseProperties(editBox, dom)

    for i = table.getn(dom.children), 1, -1 do
        local v = dom.children[ i ]
        if v.name == "BACKGROUND_SPRITE" or
            v.name == "TEXT_LABEL" or
            v.name == "PLACEHOLDER_LABEL" then
            table.remove(dom.children, i)
        end
    end

    local useOriginalSize = com.useOriginalSize
    local tabIndex = com.tabIndex
    local lineHeight = com.lineHeight

    editBox:setReturnType(com.returnType)
    editBox:setInputFlag(com.inputFlag)
    editBox:setInputMode(com.inputMode)
    editBox:setFontSize(com.fontSize)
    editBox:setFontColor(com.fontColor)
    editBox:setPlaceHolder(com.placeholder)
    editBox:setPlaceholderFontSize(com.placeFontSize);
    editBox:setPlaceholderFontColor(com.placeFontColor)
    editBox:setMaxLength(com.maxLength);
    editBox:setText(com.string)

    return editBox
end

return renderNodeCreators