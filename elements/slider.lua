-- slider.lua
local ZiaanSlider = {}
ZiaanSlider.__index = ZiaanSlider

function ZiaanSlider.new(parent, info)
    local self = setmetatable({}, ZiaanSlider)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, info.Width or 200, 0, 30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, -10, 0, 8)
    Track.Position = UDim2.new(0, 5, 0.5, -4)
    Track.BackgroundColor3 = info.Theme.Secondary
    Track.Parent = Frame

    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 14, 0, 14)
    Knob.Position = UDim2.new((info.Value or 0)/100, -7, 0.5, -7)
    Knob.BackgroundColor3 = info.Theme.Accent or Color3.new(1,1,1)
    Knob.Parent = Frame

    local dragging = false
    Knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    Knob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    Knob.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = math.clamp((input.Position.X - Track.AbsolutePosition.X)/Track.AbsoluteSize.X,0,1)
            Knob.Position = UDim2.new(rel, -7, 0.5, -7)
            if info.Callback then info.Callback(rel) end
        end
    end)

    self.Instance = Frame
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Track.BackgroundColor3 = theme.Secondary
        Knob.BackgroundColor3 = theme.Accent or Color3.new(1,1,1)
    end

    return self
end

return ZiaanSlider
