local ZiaanTextbox = {}
ZiaanTextbox.__index = ZiaanTextbox

function ZiaanTextbox.new(parent, info)
    local self = setmetatable({}, ZiaanTextbox)
    local value = info.Text or ""

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Box = Instance.new("TextBox")
    Box.Size = UDim2.new(1,0,1,0)
    Box.Text = value
    Box.BackgroundColor3 = info.Theme.Secondary
    Box.TextColor3 = info.Theme.Text
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 16
    Box.ClearTextOnFocus = false
    Box.Parent = Frame

    Box.FocusLost:Connect(function()
        value = Box.Text
        if info.Callback then info.Callback(value) end
    end)

    self.Instance = Frame
    self.GetValue = function() return value end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Box.BackgroundColor3 = theme.Secondary
        Box.TextColor3 = theme.Text
    end

    return self
end

return ZiaanTextbox
