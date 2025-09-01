-- dropdown.lua
local ZiaanDropdown = {}
ZiaanDropdown.__index = ZiaanDropdown

function ZiaanDropdown.new(parent, info)
    local self = setmetatable({}, ZiaanDropdown)
    local items = info.Items or {}
    local selected = info.Selected or items[1] or ""

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, info.Width or 150, 0, info.Height or 35)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")
    Label.Text = selected
    Label.Size = UDim2.new(1,0,1,0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Parent = Frame

    local DropdownOpen = false
    local DropFrame

    Frame.MouseButton1Click:Connect(function()
        if not DropdownOpen then
            DropdownOpen = true
            DropFrame = Instance.new("Frame")
            DropFrame.Size = UDim2.new(1,0,#items*25,0)
            DropFrame.Position = UDim2.new(0,0,1,0)
            DropFrame.BackgroundColor3 = info.Theme.Secondary
            DropFrame.Parent = Frame

            for i,v in ipairs(items) do
                local Item = Instance.new("TextButton")
                Item.Size = UDim2.new(1,0,0,25)
                Item.Position = UDim2.new(0,0,(i-1)*25,0)
                Item.Text = v
                Item.BackgroundTransparency = 1
                Item.TextColor3 = info.Theme.Text
                Item.Font = Enum.Font.Gotham
                Item.TextSize = 14
                Item.Parent = DropFrame
                Item.MouseButton1Click:Connect(function()
                    selected = v
                    Label.Text = v
                    if info.Callback then info.Callback(v) end
                    DropFrame:Destroy()
                    DropdownOpen = false
                end)
            end
        else
            DropdownOpen = false
            if DropFrame then DropFrame:Destroy() end
        end
    end)

    self.Instance = Frame
    self.GetValue = function() return selected end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Label.TextColor3 = theme.Text
        if DropFrame then DropFrame.BackgroundColor3 = theme.Secondary end
        if DropFrame then
            for _,child in pairs(DropFrame:GetChildren()) do
                if child:IsA("TextButton") then
                    child.TextColor3 = theme.Text
                end
            end
        end
    end

    return self
end

return ZiaanDropdown
