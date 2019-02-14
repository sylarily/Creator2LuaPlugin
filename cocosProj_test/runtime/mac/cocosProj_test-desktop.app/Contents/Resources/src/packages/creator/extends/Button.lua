local Button = class("creatorButton")

function Button:ctor (node)
    self.node = node
    self.touchListener = creator.utils.createTouchListener(self)
    self.node:getEventDispatcher():addEventListenerWithSceneGraphPriority(self.touchListener, self.node)

    self.target = self.node
    self.transition = creator.const.ButtonTransition_Scale
    self.ncolor = nil; self.pcolor = nil; self.dcolor = nil
    self.nsprite = nil; self.psprite = nil; self.dsprite = nil
    self.duration = 0.1; self.scale = 1.2
    self.callback = nil

    -- self.interactable = true todo
    -- self.autoGray = false todo

    self.responseStatus = 0
end

function Button:dtor ()
    self.node:getEventDispatcher():removeEventListener(self.touchListener)
    self.touchListener = nil
end

function Button:onTouchBegan (touch, event)
    local inside = creator.utils.checkTouchInside(self.node, touch)
    if inside then self:responseForTouch()
    else self:cancellResponse() end
    return inside
end

function Button:onTouchMoved (touch, event)
    local inside = creator.utils.checkTouchInside(self.node, touch)
    if inside then self:responseForTouch()
    else self:cancellResponse() end
end

function Button:onTouchEnded (touch, event)
    local inside = creator.utils.checkTouchInside(self.node, touch)
    self:cancellResponse()
    if inside and self.callback ~= nil then self.callback(self) end
end

function Button:onTouchCancelled (touch, event)
    self:cancellResponse()
end

function Button:responseForTouch ()
    if self.responseStatus == 1 then return end

    self.responseStatus = 1

    if self.transition == creator.const.ButtonTransition_Color then  
        -- todo
    elseif self.transition == creator.const.ButtonTransition_Sprite then
        -- todo
    elseif self.transition == creator.const.ButtonTransition_Scale then
        self.target:stopAllActions()
        self.target:runAction(cc.ScaleTo:create(self.duration, self.scale))
    end
end

function Button:cancellResponse ()
    if self.responseStatus == 0 then return end

    self.responseStatus = 0

    if self.transition == creator.const.ButtonTransition_Color then
        -- todo
    elseif self.transition == creator.const.ButtonTransition_Sprite then
        -- todo
    elseif self.transition == creator.const.ButtonTransition_Scale then
        self.target:stopAllActions()
        self.target:runAction(cc.ScaleTo:create(self.duration, 1))
    end
end

return Button
