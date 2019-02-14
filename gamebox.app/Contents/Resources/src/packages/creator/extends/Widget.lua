local Widget = class("creatorWidget")

function Widget:ctor (node)
    self.node = node
end

function Widget:dtor ()
end

return Widget