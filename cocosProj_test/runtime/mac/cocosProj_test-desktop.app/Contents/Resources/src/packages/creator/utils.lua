local utils = {}

utils.createTouchListener = function (ui)
    local l = cc.EventListenerTouchOneByOne:create()
    l:registerScriptHandler(function (...) return ui:onTouchBegan(...) end, cocos.TouchEvent_Began)
    l:registerScriptHandler(function (...) ui:onTouchMoved(...) end, cocos.TouchEvent_Moved)
    l:registerScriptHandler(function (...) ui:onTouchEnded(...) end, cocos.TouchEvent_Ended)
    l:registerScriptHandler(function (...) ui:onTouchCancelled(...) end, cocos.TouchEvent_Cancelled)
    return l
end

utils.checkTouchInside = function (node, touch) 
    local op = touch:getLocation()
    local p = node:convertToNodeSpace(op)
    local size = node:getContentSize()
    return p.x >= 0 and p.y >= 0 and p.x <= size.width and p.y <= size.height
end

utils.getIdentifierFromStr = function (str, prefix)
    if str == nil then return nil end
    if #str <= #prefix then return nil end
    
    local _, op = string.find(str, prefix)
    if op == nil then return nil end

    local ed = op
    for i = op + 1, #str do
        local c = string.sub(str, i, i)

        if c >= "a" and c <= "z" or 
           c >= "A" and c <= "Z" or 
           c >= "0" and c <= "9" or
           c == "_" 
        then
            ed = i
        else
            break
        end
    end

    if ed > op then
        return string.sub(str, op + 1, ed)
    else
        return nil
    end
end

return utils