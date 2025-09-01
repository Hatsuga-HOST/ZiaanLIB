-- tween.lua (ZiaanLIB utils)
local Tween = {}
local TweenService = game:GetService("TweenService")

function Tween:Create(obj, properties, duration, style, direction)
    local info = TweenInfo.new(duration or 0.25, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, info, properties)
    tween:Play()
    return tween
end

return Tween
