-- input.lua (ZiaanLIB utils)
local Input = {}
local UserInputService = game:GetService("UserInputService")

Input.Bindings = {}

function Input:BindKey(key, callback)
    Input.Bindings[key] = callback
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    local key = input.KeyCode
    if Input.Bindings[key] then
        Input.Bindings[key]()
    end
end)

return Input
