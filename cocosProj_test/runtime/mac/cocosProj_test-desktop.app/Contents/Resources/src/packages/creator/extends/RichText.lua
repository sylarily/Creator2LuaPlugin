local RichText = class("creatorRichText")

function RichText:ctor (node)
    self.node = node
end

function RichText:dtor ()
end

return RichText