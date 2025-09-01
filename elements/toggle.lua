-- toggle.lua
local ZiaanToggle = {}
ZiaanToggle.__index = ZiaanToggle

function ZiaanToggle.new(parent, info)
    local self = setmetatable({}, ZiaanToggle)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, info.Width or 150, 0, info.Height or 35)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -40, 1, 0)
    Label.Position = UDim2.new(0, 5, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = info.Text or "Toggle"
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 30, 0, 30)
    Button.Position = UDim2.new(1, -35, 0.5, -15)
    Button.Text = info.Value and "✔" or ""
    Button.BackgroundColor3 = info.Theme.Secondary
    Button.TextColor3 = info.Theme.Text
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 18
    Button.Parent = Frame

    local value = info.Value or false
    Button.MouseButton1Click:Connect(function()
        value = not value
        Button.Text = value and "✔" or ""
        if info.Callback then info.Callback(value) end
    end)

    self.Instance = Frame
    self.GetValue = function() return value end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Button.BackgroundColor3 = theme.Secondary
        Label.TextColor3 = theme.Text
        Button.TextColor3 = theme.Text
    end

    return self
end

return ZiaanToggle
