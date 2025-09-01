local ZiaanMultiSelect = {}
ZiaanMultiSelect.__index = ZiaanMultiSelect

function ZiaanMultiSelect.new(parent, info)
    local self = setmetatable({}, ZiaanMultiSelect)
    local values = {}

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,30)
    Frame.BackgroundColor3 = info.Theme.Primary
    Frame.Parent = parent

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1,0,1,0)
    Btn.Text = "Select"
    Btn.BackgroundColor3 = info.Theme.Secondary
    Btn.TextColor3 = info.Theme.Text
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 16
    Btn.Parent = Frame

    local DropFrame = Instance.new("Frame")
    DropFrame.Size = UDim2.new(1,0,0,#(info.Items or {})*25)
    DropFrame.Position = UDim2.new(0,0,1,0)
    DropFrame.BackgroundColor3 = info.Theme.Primary
    DropFrame.Visible = false
    DropFrame.Parent = Frame

    for i,item in ipairs(info.Items or {}) do
        local ItemBtn = Instance.new("TextButton")
        ItemBtn.Size = UDim2.new(1,0,0,25)
        ItemBtn.Position = UDim2.new(0,0,0,(i-1)*25)
        ItemBtn.Text = item
        ItemBtn.BackgroundColor3 = info.Theme.Secondary
        ItemBtn.TextColor3 = info.Theme.Text
        ItemBtn.Font = Enum.Font.Gotham
        ItemBtn.TextSize = 14
        ItemBtn.Parent = DropFrame

        ItemBtn.MouseButton1Click:Connect(function()
            if table.find(values, item) then
                for k,v in pairs(values) do
                    if v == item then table.remove(values,k) end
                end
            else
                table.insert(values,item)
            end
            Btn.Text = #values > 0 and table.concat(values,", ") or "Select"
            if info.Callback then info.Callback(values) end
        end)
    end

    Btn.MouseButton1Click:Connect(function()
        DropFrame.Visible = not DropFrame.Visible
    end)

    self.Instance = Frame
    self.GetValue = function() return values end
    self.UpdateTheme = function(theme)
        Frame.BackgroundColor3 = theme.Primary
        Btn.BackgroundColor3 = theme.Secondary
        Btn.TextColor3 = theme.Text
        DropFrame.BackgroundColor3 = theme.Primary
        for _, child in pairs(DropFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = theme.Secondary
                child.TextColor3 = theme.Text
            end
        end
    end

    return self
end

return ZiaanMultiSelect
