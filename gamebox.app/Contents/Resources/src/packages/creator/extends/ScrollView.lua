local ScrollView = class("creatorScrollView")

function ScrollView:ctor (node)
    self.node = node
end

function ScrollView:dtor ()
end

return ScrollView