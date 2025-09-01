-- extras/console.lua
local Console = {}
Console.Logs = {}

function Console:Log(text, color)
    color = color or Color3.new(1,1,1)
    table.insert(self.Logs, {Text=text, Color=color})
    print("[ZiaanLIB Console] "..text)
end

function Console:Clear()
    self.Logs = {}
end

return Console
