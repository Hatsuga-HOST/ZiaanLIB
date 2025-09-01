-- label.lua
local ZiaanLabel = {}
ZiaanLabel.__index = ZiaanLabel

function ZiaanLabel.new(parent, info)
    local self = setmetatable({}, ZiaanLabel)
    local Text = info.Text or "Label"

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1,0,0,info.Height or 20)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Parent = parent

    self.Instance = Label
    self.UpdateTheme = function(theme)
        Label.TextColor3 = theme.Text
    end

    return self
end

return ZiaanLabel
