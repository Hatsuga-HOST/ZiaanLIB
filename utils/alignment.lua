-- alignment.lua (ZiaanLIB utils)
local Alignment = {}

-- Auto align children vertically
function Alignment:Vertical(frame, padding)
    padding = padding or 5
    local y = 0
    for _, child in pairs(frame:GetChildren()) do
        if child:IsA("GuiObject") then
            child.Position = UDim2.new(0, 0, 0, y)
            y = y + child.Size.Y.Offset + padding
        end
    end
end

-- Auto align children horizontally
function Alignment:Horizontal(frame, padding)
    padding = padding or 5
    local x = 0
    for _, child in pairs(frame:GetChildren()) do
        if child:IsA("GuiObject") then
            child.Position = UDim2.new(0, x, 0, 0)
            x = x + child.Size.X.Offset + padding
        end
    end
end

return Alignment
