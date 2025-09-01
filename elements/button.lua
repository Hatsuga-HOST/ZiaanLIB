-- button.lua
local ZiaanButton = {}
ZiaanButton.__index = ZiaanButton

function ZiaanButton.new(parent, info)
    local self = setmetatable({}, ZiaanButton)

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, info.Width or 150, 0, info.Height or 35)
    Btn.Position = info.Position or UDim2.new(0,0,0,0)
    Btn.Text = info.Text or "Button"
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 18
    Btn.BackgroundColor3 = info.Theme.Primary
    Btn.TextColor3 = info.Theme.Text
    Btn.Parent = parent

    Btn.MouseButton1Click:Connect(function()
        if info.Callback then
            info.Callback()
        end
    end)

    self.Instance = Btn
    self.Theme = info.Theme
    return self
end

function ZiaanButton:UpdateTheme(theme)
    if self.Instance then
        self.Instance.BackgroundColor3 = theme.Primary
        self.Instance.TextColor3 = theme.Text
    end
end

return ZiaanButton
