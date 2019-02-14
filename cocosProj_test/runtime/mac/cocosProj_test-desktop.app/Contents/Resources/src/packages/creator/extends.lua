local extends = {}

extends[ "cc.ToggleGroup" ] = {
    priority = creator.const.ExtendPriority_Low,
    fun = function (node, com, idmap)
        local group = creator.ToggleGroup.new(node)
        return group
    end
}

extends[ "cc.Button" ] = {
    priority = creator.const.ExtendPriority_Normal,
    fun = function (node, com, idmap)
        local button = creator.Button.new(node)

        button.target = idmap[ com.target.id ]
    
        return button
    end
}

extends[ "cc.Toggle" ] = {
    priority = creator.const.ExtendPriority_Normal,
    fun = function (node, com, idmap)
        local toggle = creator.Toggle.new(node)

        toggle.target = idmap[ com.target.id ]
        toggle:setChecked(com.checked)
        if com.checkmark ~= nil then
            toggle:setCheckmark(idmap[ com.checkmark.id ])
        end

        return toggle
    end
}

return extends