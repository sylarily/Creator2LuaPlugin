local ToggleGroup = class("creatorToggleGroup")

function ToggleGroup:ctor (node)
    self.node = node

    self.allowSwitchOff = false
    self.callback = nil
end

function ToggleGroup:dtor ()
end

return ToggleGroup