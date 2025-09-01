-- keybind.lua
local ZiaanKeybind = {}
ZiaanKeybind.__index = ZiaanKeybind

function ZiaanKeybind.new(parent, info)
    local self = setmetatable({}, ZiaanKeybind)
    local key = info.Key or "None"

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, info.Width or 150, 0, info.Height or 35)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = info.Text or "Keybind"
    Label.Size = UDim2.new(0.6,0,1,0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Parent = Frame

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0.4,0,1,0)
    Btn.Position = UDim2.new(0.6,0,0,0)
    Btn.Text = key
    Btn.BackgroundColor3 = info.Theme.Secondary
    Btn.TextColor3 = info.Theme.Text
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 16
    Btn.Parent = Frame

    Btn.MouseButton1Click:Connect(function()
        Btn.Text = "..."
        local conn
        conn = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Keyboard then
                key = input.KeyCode.Name
                Btn.Text = key
                if info.Callback then info.Callback(key) end
                conn:Disconnect()
            end
        end)
    end)

    self.Instance = Frame
    self.GetValue = function() return key end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Btn.BackgroundColor3 = theme.Secondary
        Label.TextColor3 = theme.Text
        Btn.TextColor3 = theme.Text
    end

    return self
end

return ZiaanKeybind
