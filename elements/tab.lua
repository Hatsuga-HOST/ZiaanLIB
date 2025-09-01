local ZiaanTab = {}
ZiaanTab.__index = ZiaanTab

function ZiaanTab.new(parent, info)
    local self = setmetatable({}, ZiaanTab)
    local Frame = Instance.new("Frame")
    Frame.Size = info.Size or UDim2.new(1,0,0,30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,0,1,0)
    Btn.Text = info.Title or "Tab"
    Btn.BackgroundColor3 = info.Theme.Secondary
    Btn.TextColor3 = info.Theme.Text
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 16
    Btn.Parent = Frame

    self.Instance = Frame
    self.Select = function()
        if info.Callback then info.Callback() end
    end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Btn.BackgroundColor3 = theme.Secondary
        Btn.TextColor3 = theme.Text
    end

    return self
end

return ZiaanTab
