-- config.lua (ZiaanLIB)
-- Save/Load user config in JSON

local Config = {}
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- Default config storage
Config.Data = {}

-- File name / key (CoreGui storage)
Config.FileName = "ZiaanLIB_Config"

-- Save current config
function Config:Save()
    local success, err = pcall(function()
        local json = HttpService:JSONEncode(self.Data)
        -- Roblox CoreGui doesn't support file system; store in PlayerGui / Values
        local player = Players.LocalPlayer
        if player then
            local storage = player:FindFirstChild(self.FileName)
            if not storage then
                storage = Instance.new("StringValue")
                storage.Name = self.FileName
                storage.Parent = player
            end
            storage.Value = json
        end
    end)
    if not success then
        warn("ZiaanLIB Config Save Failed: "..tostring(err))
    end
end

-- Load config
function Config:Load()
    local player = Players.LocalPlayer
    if not player then return end
    local storage = player:FindFirstChild(self.FileName)
    if storage then
        local success, data = pcall(function()
            return HttpService:JSONDecode(storage.Value)
        end)
        if success then
            self.Data = data or {}
        else
            warn("ZiaanLIB Config Load Failed: "..tostring(data))
        end
    end
end

-- Get value
function Config:Get(key, default)
    if self.Data[key] ~= nil then
        return self.Data[key]
    else
        return default
    end
end

-- Set value
function Config:Set(key, value)
    self.Data[key] = value
    self:Save()
end

return Config
