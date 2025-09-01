-- themes.lua - ZiaanLIB Maximal Theme Manager

local Themes = {}

-- Preset Themes
Themes.Presets = {
    dark = {
        Name = "Dark",
        Primary = Color3.fromRGB(30,30,30),
        Secondary = Color3.fromRGB(45,45,45),
        Accent = Color3.fromRGB(0,170,255),
        Text = Color3.fromRGB(255,255,255)
    },
    light = {
        Name = "Light",
        Primary = Color3.fromRGB(245,245,245),
        Secondary = Color3.fromRGB(220,220,220),
        Accent = Color3.fromRGB(0,120,255),
        Text = Color3.fromRGB(0,0,0)
    },
    neon = {
        Name = "Neon",
        Primary = Color3.fromRGB(0,0,0),
        Secondary = Color3.fromRGB(25,25,25),
        Accent = Color3.fromRGB(0,255,255),
        Text = Color3.fromRGB(255,0,255)
    },
    pastel = {
        Name = "Pastel",
        Primary = Color3.fromRGB(255,228,225),
        Secondary = Color3.fromRGB(255,240,245),
        Accent = Color3.fromRGB(255,182,193),
        Text = Color3.fromRGB(50,50,50)
    },
    retro = {
        Name = "Retro",
        Primary = Color3.fromRGB(50,50,50),
        Secondary = Color3.fromRGB(100,100,100),
        Accent = Color3.fromRGB(255,165,0),
        Text = Color3.fromRGB(200,200,200)
    },
    cyberpunk = {
        Name = "Cyberpunk",
        Primary = Color3.fromRGB(10,10,10),
        Secondary = Color3.fromRGB(25,0,40),
        Accent = Color3.fromRGB(255,0,200),
        Text = Color3.fromRGB(0,255,255)
    },
    classic = {
        Name = "Classic",
        Primary = Color3.fromRGB(35,35,35),
        Secondary = Color3.fromRGB(50,50,50),
        Accent = Color3.fromRGB(0,120,255),
        Text = Color3.fromRGB(255,255,255)
    },
    custom = {
        Name = "Custom",
        Primary = Color3.fromRGB(255,255,255),
        Secondary = Color3.fromRGB(200,200,200),
        Accent = Color3.fromRGB(0,120,255),
        Text = Color3.fromRGB(0,0,0)
    }
}

-- Set current theme
Themes.Current = Themes.Presets.classic

-- Load preset theme by name
function Themes:LoadPreset(name)
    local preset = self.Presets[name]
    if preset then
        self.Current = preset
        return preset
    else
        warn("[ZiaanLIB Themes] Preset not found:", name)
        return self.Current
    end
end

-- Set custom theme
-- Example: Themes:SetCustom({Primary=Color3.new(), Secondary=..., Accent=..., Text=...})
function Themes:SetCustom(tbl)
    self.Presets.custom = tbl
    self.Current = tbl
end

-- Update current theme colors individually
function Themes:UpdateColors(tbl)
    for k,v in pairs(tbl) do
        if self.Current[k] ~= nil then
            self.Current[k] = v
        end
    end
end

-- Get color by type (Primary, Secondary, Accent, Text)
function Themes:GetColor(type_)
    return self.Current[type_] or Color3.fromRGB(255,255,255)
end

-- List available presets
function Themes:GetPresets()
    local keys = {}
    for k,_ in pairs(self.Presets) do
        table.insert(keys,k)
    end
    return keys
end

return Themes
