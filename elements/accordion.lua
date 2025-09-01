local ZiaanAccordion = {}
ZiaanAccordion.__index = ZiaanAccordion

function ZiaanAccordion.new(parent, info)
    local self = setmetatable({}, ZiaanAccordion)
    local expanded = false

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Header = Instance.new("TextButton")
    Header.Size = UDim2.new(1,0,0,30)
    Header.Text = info.Title or "Accordion"
    Header.BackgroundColor3 = info.Theme.Secondary
    Header.TextColor3 = info.Theme.Text
    Header.Font = Enum.Font.Gotham
    Header.TextSize = 16
    Header.Parent = Frame

    local Content = Instance.new("Frame")
    Content.Size = UDim2.new(1,0,0, info.Height or 100)
    Content.Position = UDim2.new(0,0,1,0)
    Content.BackgroundColor3 = info.Theme.Primary
    Content.Visible = false
    Content.Parent = Frame

    Header.MouseButton1Click:Connect(function()
        expanded = not expanded
        Content.Visible = expanded
    end)

    self.Instance = Frame
    self.Content = Content
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Header.BackgroundColor3 = theme.Secondary
        Header.TextColor3 = theme.Text
        Content.BackgroundColor3 = theme.Primary
    end

    return self
end

return ZiaanAccordion
