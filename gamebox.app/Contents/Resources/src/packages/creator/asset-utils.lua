local assetUtils = {}

assetUtils.createSpriteFrame = function (info, trimmed)
    if info == nil then return nil end

    local uri = trimmed and info.uri..".trimmed" or info.uri
    local sf = cclua.sfCache:getSpriteFrame(uri)

    if sf == nil then
        local rotated = false
        if info.rotated and info.rotated > 0 then
            rotated = true
        end
        sf = cc.SpriteFrame:createWithTexture(
            cclua.textureCache:addImage(info.texture), 
            info.rect, 
            rotated,
            info.offset, 
            trimmed and { width=info.rect.width, height=info.rect.height } or info.originalSize
        )

        if info.capInsets ~= nil then
            sf:setCenterRectInPixels(info.capInsets) 
        end

        cclua.sfCache:addSpriteFrame(sf, uri)
    end

    return sf
end

return assetUtils