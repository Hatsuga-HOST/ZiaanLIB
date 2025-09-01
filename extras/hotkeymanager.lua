-- extras/hotkeymanager.lua
local UserInputService = game:GetService("UserInputService")
local HotkeyManager = {}
HotkeyManager.Bindings = {}

function HotkeyManager:Bind(key, callback)
    self.Bindings[key] = callback
end

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    local key = input.KeyCode.Name
    if HotkeyManager.Bindings[key] then
        HotkeyManager.Bindings[key]()
    end
end)

return HotkeyManager
