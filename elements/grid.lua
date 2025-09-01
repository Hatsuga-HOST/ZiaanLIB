local ZiaanGrid = {}
ZiaanGrid.__index = ZiaanGrid

function ZiaanGrid.new(parent, info)
    local self = setmetatable({}, ZiaanGrid)
    local rows = info.Rows or {}
    local columns = info.Columns or {}

    local Frame = Instance.new("Frame")
    Frame.Size = info.Size or UDim2.new(1,0,0,100)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    for i,row in ipairs(rows) do
        for j,col in ipairs(columns) do
            local Cell = Instance.new("TextLabel")
            Cell.Size = UDim2.new(1/#columns,0,0,20)
            Cell.Position = UDim2.new((j-1)/#columns,0,(i-1)*20,0)
            Cell.Text = row[col] or ""
            Cell.TextColor3 = info.Theme.Text
            Cell.BackgroundTransparency = 1
            Cell.Font = Enum.Font.Gotham
            Cell.TextSize = 14
            Cell.Parent = Frame
        end
    end

    self.Instance = Frame
    self.UpdateTheme = function(theme) end

    return self
end

return ZiaanGrid
