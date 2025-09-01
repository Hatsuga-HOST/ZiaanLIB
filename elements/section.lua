local ZiaanSection = {}
ZiaanSection.__index = ZiaanSection

function ZiaanSection.new(parent, info)
    local self = setmetatable({}, ZiaanSection)
    local Frame = Instance.new("Frame")
    Frame.Size = info.Size or UDim2.new(1,0,0,100)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1,0,0,25)
    Label.Text = info.Title or "Section"
    Label.BackgroundTransparency = 1
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Parent = Frame

    self.Instance = Frame
    self.Elements = {}
    self.AddElement = function(element)
        table.insert(self.Elements, element)
        element.Instance.Parent = Frame
    end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Label.TextColor3 = theme.Text
        for _, elem in pairs(self.Elements) do
            if elem.UpdateTheme then
                elem:UpdateTheme(theme)
            end
        end
    end

    return self
end

return ZiaanSection
