-- themes.lua (ZiaanLIB)
-- Theme manager: preset + custom themes

local Themes = {}

-- Default theme container
Themes.Current = {}

-- Preset Themes
Themes.dark = {
    Name = "Dark",
    Primary = Color3.fromRGB(30,30,30),
    Secondary = Color3.fromRGB(45,45,45),
    Text = Color3.fromRGB(255,255,255),
    Accent = Color3.fromRGB(0, 120, 255),
    Border = Color3.fromRGB(70,70,70)
}

Themes.light = {
    Name = "Light",
    Primary = Color3.fromRGB(240,240,240),
    Secondary = Color3.fromRGB(220,220,220),
    Text = Color3.fromRGB(20,20,20),
    Accent = Color3.fromRGB(0, 120, 255),
    Border = Color3.fromRGB(180,180,180)
}

Themes.neon = {
    Name = "Neon",
    Primary = Color3.fromRGB(10,10,10),
    Secondary = Color3.fromRGB(20,20,20),
    Text = Color3.fromRGB(255,255,255),
    Accent = Color3.fromRGB(0,255,255),
    Border = Color3.fromRGB(0,255,255)
}

Themes.pastel = {
    Name = "Pastel",
    Primary = Color3.fromRGB(255, 223, 230),
    Secondary = Color3.fromRGB(255, 240, 245),
    Text = Color3.fromRGB(50,50,50),
    Accent = Color3.fromRGB(255, 160, 180),
    Border = Color3.fromRGB(200,180,190)
}

Themes.retro = {
    Name = "Retro",
    Primary = Color3.fromRGB(50,50,100),
    Secondary = Color3.fromRGB(80,80,120),
    Text = Color3.fromRGB(255,255,0),
    Accent = Color3.fromRGB(255,0,0),
    Border = Color3.fromRGB(100,100,150)
}

Themes.cyberpunk = {
    Name = "Cyberpunk",
    Primary = Color3.fromRGB(15,15,25),
    Secondary = Color3.fromRGB(25,10,35),
    Text = Color3.fromRGB(255,255,255),
    Accent = Color3.fromRGB(255,0,255),
    Border = Color3.fromRGB(50,0,50)
}

Themes.classic = {
    Name = "Classic",
    Primary = Color3.fromRGB(34,34,34),
    Secondary = Color3.fromRGB(50,50,50),
    Text = Color3.fromRGB(255,255,255),
    Accent = Color3.fromRGB(0,170,255),
    Border = Color3.fromRGB(70,70,70)
}

-- Custom theme placeholder
Themes.custom = {
    Name = "Custom",
    Primary = Color3.fromRGB(40,40,40),
    Secondary = Color3.fromRGB(60,60,60),
    Text = Color3.fromRGB(255,255,255),
    Accent = Color3.fromRGB(0,200,255),
    Border = Color3.fromRGB(80,80,80)
}

-- Set initial theme
Themes.Current = Themes.classic

return Themes
