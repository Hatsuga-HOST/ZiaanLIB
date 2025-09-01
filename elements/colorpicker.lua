local ZiaanColorpicker = {}
ZiaanColorpicker.__index = ZiaanColorpicker

function ZiaanColorpicker.new(parent, info)
    local self = setmetatable({}, ZiaanColorpicker)
    local color = info.Color or Color3.new(1,1,1)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,0,1,0)
    Btn.Text = ""
    Btn.BackgroundColor3 = color
    Btn.Parent = Frame

    Btn.MouseButton1Click:Connect(function()
        color = Color3.new(math.random(),math.random(),math.random())
        Btn.BackgroundColor3 = color
        if info.Callback then info.Callback(color) end
    end)

    self.Instance = Frame
    self.GetValue = function() return color end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
    end

    return self
end

return ZiaanColorpicker
