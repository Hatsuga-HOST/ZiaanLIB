local ZiaanSeparator = {}
ZiaanSeparator.__index = ZiaanSeparator

function ZiaanSeparator.new(parent, info)
    local self = setmetatable({}, ZiaanSeparator)

    local Line = Instance.new("Frame")
    Line.Size = UDim2.new(1,0,0,2)
    Line.BackgroundColor3 = info.Theme.Secondary
    Line.Parent = parent

    self.Instance = Line
    self.UpdateTheme = function(theme)
        Line.BackgroundColor3 = theme.Secondary
    end

    return self
end

return ZiaanSeparator
