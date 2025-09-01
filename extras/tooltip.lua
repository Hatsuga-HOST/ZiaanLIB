-- extras/tooltip.lua
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Tooltip = {}
Tooltip.Active = {}

function Tooltip:Attach(element, text)
    local tip = Instance.new("TextLabel")
    tip.Text = text
    tip.BackgroundTransparency = 0.5
    tip.BackgroundColor3 = Color3.new(0,0,0)
    tip.TextColor3 = Color3.new(1,1,1)
    tip.Size = UDim2.new(0, 200, 0, 30)
    tip.Visible = false
    tip.Parent = element.Parent

    element.MouseEnter:Connect(function()
        tip.Visible = true
    end)
    element.MouseLeave:Connect(function()
        tip.Visible = false
    end)

    RunService.RenderStepped:Connect(function()
        if tip.Visible then
            local mouse = UserInputService:GetMouseLocation()
            tip.Position = UDim2.new(0, mouse.X+10, 0, mouse.Y+10)
        end
    end)
end

return Tooltip
