local ZiaanProgressbar = {}
ZiaanProgressbar.__index = ZiaanProgressbar

function ZiaanProgressbar.new(parent, info)
    local self = setmetatable({}, ZiaanProgressbar)
    local value = info.Value or 0

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,20)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(value,0,1,0)
    Bar.BackgroundColor3 = info.Theme.Secondary
    Bar.Parent = Frame

    self.Instance = Frame
    self.SetValue = function(val)
        value = math.clamp(val,0,1)
        Bar.Size = UDim2.new(value,0,1,0)
    end
    self.GetValue = function() return value end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Bar.BackgroundColor3 = theme.Secondary
    end

    return self
end

return ZiaanProgressbar
