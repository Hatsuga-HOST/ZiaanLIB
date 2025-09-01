local ZiaanTimer = {}
ZiaanTimer.__index = ZiaanTimer

function ZiaanTimer.new(parent, info)
    local self = setmetatable({}, ZiaanTimer)
    local time = info.Time or 0
    local running = false

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1,0,0,20)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = info.Theme.Text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 16
    Label.Text = tostring(time)
    Label.Parent = parent

    self.Instance = Label
    self.Start = function()
        running = true
        spawn(function()
            while running do
                time = time + 1
                Label.Text = tostring(time)
                wait(1)
            end
        end)
    end
    self.Stop = function() running=false end
    self.Reset = function() time=0; Label.Text="0" end
    self.GetValue = function() return time end
    self.UpdateTheme = function(theme)
        Label.TextColor3 = theme.Text
    end

    return self
end

return ZiaanTimer
