local nodes = {}

nodes[ "cc.Node" ] = {
    create = function (dom, com)
        local node = cclua.newNode()
        return node
    end,
    adjust = function (dom, com, node)
    end
}

nodes[ "cc.Sprite" ] = {
    create = function (dom, com)
        local spr = cclua.newSprite()
        return spr
    end,
    adjust = function (dom, com, spr)
        spr:setSpriteFrame(creator.assetUtils.createSpriteFrame(com.spriteFrame, com.trimmedMode))
        spr:setContentSize(dom.size)

        if com.renderType == creator.const.SpriteType_Simple then 
            spr:setCenterRectNormalized({ x=0, y=0, width=1, height=1 }) 
        end
    end
}

nodes[ "cc.Mask" ] = {
    create = function (dom, com)
        local mask = cclua.newMask()
        return mask
    end,
    adjust = function (dom, com, mask)
        mask:setInverted(com.inverted)
    
        local type = com.modeType
        if type == creator.const.MaskType_Rect then
            local size = mask:getContentSize()
            local rectangle = {
                {x = 0, y = 0},
                {x = size.width, y = 0 },
                {x = size.width, y = size.height},
                {x = 0, y = size.height}
            }
            local stencil = cc.DrawNode:create()
            stencil:drawPolygon(rectangle, 4, cc.c4f(1, 1, 1, 1), 1, cc.c4f(1, 1, 1, 1))
            mask:setStencil(stencil)

        elseif type == creator.const.MaskType_Ellipse then
            local size = mask:getContentSize()
            local r = math.min(size.width, size.height) / 2
            local segments = com.segements
            local stencil = cc.DrawNode:create()
            stencil:drawSolidCircle(cc.vertex2F(r, r), r, math.pi * 2, segments, cc.c4f(1, 1, 1, 1))
            mask:setStencil(stencil)

        elseif type == creator.const.MaskType_ImageSten then
            local alphaThreshold = com.alphaThreshold
            local spriteFrame = creator.assetUtils.createSpriteFrame(com.spriteFrame, true)
            local stencil = cclua.newSprite()
            stencil:setSpriteFrame(spriteFrame)
            stencil:setContentSize(mask:getContentSize())
            stencil:setAnchorPoint({ x=0, y=0 })
            stencil:setCenterRectNormalized({ x=0, y=0, width=1, height=1 }) 
            mask:setStencil(stencil)
            mask:setAlphaThreshold(alphaThreshold)
        end
    end
}

nodes[ "sp.Skeleton" ] = {
    create = function (dom, com)
        local spine = cclua.newSpineAnim(com.skeleton.json, com.skeleton.atlas, com.timeScale)
        return spine
    end,
    adjust = function (dom, com, spine)
        spine:setSkin(com.defaultSkin)
        spine:setAnimation(0, com.defaultAnim, com.loop)
        spine:setDebugSlotsEnabled(com.debugSlots)
        spine:setDebugBonesEnabled(com.debugBones)
        spine:setContentSize({ width=0, height=0 })
    end
}

nodes[ "cc.ParticleSystem" ] = {
    create = function (dom, com)
        local particle = cclua.newParticle(com.file)
        return particle
    end,
    adjust = function (dom, com, particle)
        if not com.playOnLoad then particle:stop() end
        particle:setAutoRemoveOnFinish(com.autoRemoveOnFinish)
        particle:setBlendFunc({src=com.srcBlendFactor, dst=com.dstBlendFactor})
    
        if com.spriteFrame ~= nil then
            local texture = cclua.textureCache:addImage(com.spriteFrame.texture)
            if texture then particle:setTextureWithRect(texture, com.spriteFrame.rect) end
        end

        particle:setContentSize({ width=0, height=0 })
    end
}

nodes[ "cc.Label" ] = {
    create = function (dom, com)
        local label
        if com.systemFont then
            label = cclua.newSystemLabel(com.fontFamily, com.fontSize, com.string)
        else
            label = cclua.newLabel(com.font or "", com.fontSize, com.string, com.spacingX)
        end
        return label
    end,
    adjust = function (dom, com, label)
        label:setDimensions(dom.size.width, dom.size.height)
        label:setHorizontalAlignment(com.halign)
        label:setVerticalAlignment(com.valign)
        label:setOverflow(com.overflow)
        label:enableWrap(com.enableWrapText)

        for i, data in ipairs(dom.components or {}) do
            if data.type == "cc.LabelOutline" and data.enabled then
                local c = data.color
                label:enableOutline(cc.c4b(c.r, c.g, c.b, c.a or 255), data.width)
                break
            end
        end
    end
}

nodes[ "cc.EditBox" ] = {
    create = function (dom, com)
        local zeroRect = { x=0, y=0, width=0, height=0 }
        local emptySf = cc.SpriteFrame:create(com.backgroundImage.texture, zeroRect)
        local emptySpr = ccui.Scale9Sprite:createWithSpriteFrame(emptySf)
        local editBox = cclua.newEditBox(dom.size, emptySpr)
        local children = editBox:getChildren()
        local label = children[ 1 ]
        local labelPlaceholder = children[ 2 ]
        return editBox, { "cc.Label", label, "cc.Label", labelPlaceholder }
    end,
    adjust = function (dom, com, editBox)
        editBox:setText(com.string)
        editBox:setFontSize(com.fontSize)
        editBox:setFontColor(com.fontColor)
        editBox:setPlaceHolder(com.placeholder)
        editBox:setPlaceholderFontSize(com.placeFontSize)
        editBox:setPlaceholderFontColor(com.placeFontColor)
        editBox:setMaxLength(com.maxLength)
        editBox:setReturnType(com.returnType)
        editBox:setInputFlag(com.inputFlag)
        editBox:setInputMode(com.inputMode)
    end
}

return nodes