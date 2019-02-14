local extends = {}

extends[ "cc.Layout" ] = {
    priority = creator.const.ExtendPriority_High,
    fun = function (node, com, idmap)
        local layout = creator.Layout.new(node)
        return layout
    end
}

extends[ "cc.ScrollBar" ] = {
    priority = creator.const.ExtendPriority_High,
    fun = function (node, com, idmap)
        local scrollBar = creator.ScrollBar.new(node)
        return scrollBar
    end
}

extends[ "cc.Widget" ] = {
    priority = creator.const.ExtendPriority_Normal,
    fun = function (node, com, idmap)
        local widget = creator.Widget.new(node)
        return widget
    end
}

extends[ "cc.ScrollView" ] = {
    priority = creator.const.ExtendPriority_Normal,
    fun = function (node, com, idmap)
        local scrollView = creator.ScrollView.new(node)
        return scrollView
    end
}

extends[ "cc.RichText" ] = {
    priority = creator.const.ExtendPriority_Normal,
    fun = function (node, com, idmap)
        local richText = creator.RichText.new(node)
        return richText
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

extends[ "cc.ToggleGroup" ] = {
    priority = creator.const.ExtendPriority_Low,
    fun = function (node, com, idmap)
        local group = creator.ToggleGroup.new(node)
        return group
    end
}

return extends