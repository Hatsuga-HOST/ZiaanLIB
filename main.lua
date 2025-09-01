-- main.lua (ZiaanLIB Core - Full Updated)
-- Features: window/page/section system, element manager, theme/config, notifications, tweening, extras-ready

local ZiaanLIB = {}
ZiaanLIB.Windows = {}
ZiaanLIB.Elements = {}
ZiaanLIB.Themes = require(script.Parent.themes)
ZiaanLIB.Config = require(script.Parent.config)

-- Load utils
local Tween = require(script.Parent.utils.tween)
local Notifications = require(script.Parent.utils.notifications)
local Input = require(script.Parent.utils.input)
local Alignment = require(script.Parent.utils.alignment)
local MathUtil = require(script.Parent.utils.math)
local TableUtil = require(script.Parent.utils.table)

-- Load extras placeholders
local Console = require(script.Parent.extras.console)
local HotkeyManager = require(script.Parent.extras.hotkeymanager)
local Draggable = require(script.Parent.extras.draggable)
local Tooltip = require(script.Parent.extras.tooltip)
local Screenshot = require(script.Parent.extras.screenshot)
local ParticlePreview = require(script.Parent.extras.particlepreview)

-- Internal helpers
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- Tween helper
function ZiaanLIB:Tween(obj, properties, time, style, direction)
    local info = TweenInfo.new(time or 0.25, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, info, properties)
    tween:Play()
    return tween
end

-- Create Window
function ZiaanLIB:CreateWindow(info)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = info.Name or "ZiaanLIB"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, info.Width or 500, 0, info.Height or 350)
    Frame.Position = UDim2.new(0.5, -(info.Width or 500)/2, 0.5, -(info.Height or 350)/2)
    Frame.BackgroundColor3 = self.Themes.Current.Primary
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame

    -- Title Bar
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundTransparency = 1
    Title.Text = info.Name or "ZiaanLIB"
    Title.TextColor3 = self.Themes.Current.Text
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 24
    Title.Parent = Frame

    -- Control Buttons
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 10)
    CloseBtn.Text = "X"
    CloseBtn.BackgroundTransparency = 0.5
    CloseBtn.TextColor3 = Color3.new(1,0,0)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    CloseBtn.Parent = Frame
    CloseBtn.MouseButton1Click:Connect(function()
        self:DestroyWindow({ScreenGui = ScreenGui})
    end)

    -- Dragging
    local dragging, dragInput, dragStart, startPos
    local function update(input)
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    Title.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- Window Data
    local WindowData = {
        ScreenGui = ScreenGui,
        Frame = Frame,
        Pages = {},
        Elements = {},
        Info = info
    }
    table.insert(self.Windows, WindowData)
    return WindowData
end

-- Create Page
function ZiaanLIB:CreatePage(window, name)
    local PageFrame = Instance.new("Frame")
    PageFrame.Size = UDim2.new(1, 0, 1, -50)
    PageFrame.Position = UDim2.new(0,0,0,50)
    PageFrame.BackgroundTransparency = 1
    PageFrame.Visible = true
    PageFrame.Parent = window.Frame

    local Page = {Name = name, Frame = PageFrame, Elements = {}}
    table.insert(window.Pages, Page)
    return Page
end

-- Create Section
function ZiaanLIB:CreateSection(page, name)
    local SectionFrame = Instance.new("Frame")
    SectionFrame.Size = UDim2.new(1, 0, 0, 100)
    SectionFrame.BackgroundTransparency = 0.1
    SectionFrame.BackgroundColor3 = self.Themes.Current.Secondary
    SectionFrame.Parent = page.Frame

    local Label = Instance.new("TextLabel")
    Label.Text = name or "Section"
    Label.Size = UDim2.new(1, 0, 0, 25)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = self.Themes.Current.Text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 18
    Label.Parent = SectionFrame

    local Section = {Frame = SectionFrame, Name = name, Elements = {}}
    table.insert(page.Elements, Section)
    return Section
end

-- Register Element
function ZiaanLIB:RegisterElement(parent, element)
    table.insert(parent.Elements, element)
end

-- Set Theme
function ZiaanLIB:SetTheme(name)
    local theme = self.Themes[name]
    if theme then
        self.Themes.Current = theme
        self:UpdateAllWindows()
    end
end

-- Update All Windows
function ZiaanLIB:UpdateAllWindows()
    for _, win in pairs(self.Windows) do
        win.Frame.BackgroundColor3 = self.Themes.Current.Primary
        for _, page in pairs(win.Pages) do
            for _, elem in pairs(page.Elements) do
                if elem.UpdateTheme then
                    elem:UpdateTheme(self.Themes.Current)
                end
            end
        end
    end
end

-- Notifications
function ZiaanLIB:Notify(title, text, type_)
    Notifications:Show(title, text, type_)
end

-- Config
function ZiaanLIB:SaveConfig()
    if self.Config then self.Config:Save() end
end
function ZiaanLIB:LoadConfig()
    if self.Config then
        self.Config:Load()
        self:UpdateAllWindows()
    end
end

-- Destroy Window
function ZiaanLIB:DestroyWindow(window)
    if window and window.ScreenGui then
        window.ScreenGui:Destroy()
        for i, w in pairs(self.Windows) do
            if w == window then
                table.remove(self.Windows, i)
                break
            end
        end
    end
end

-- Extras shortcuts
ZiaanLIB.Console = Console
ZiaanLIB.HotkeyManager = HotkeyManager
ZiaanLIB.Draggable = Draggable
ZiaanLIB.Tooltip = Tooltip
ZiaanLIB.Screenshot = Screenshot
ZiaanLIB.ParticlePreview = ParticlePreview

return ZiaanLIB
