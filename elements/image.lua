local ZiaanImage = {}
ZiaanImage.__index = ZiaanImage

function ZiaanImage.new(parent, info)
    local self = setmetatable({}, ZiaanImage)

    local Img = Instance.new("ImageLabel")
    Img.Size = info.Size or UDim2.new(1,0,0,100)
    Img.Position = info.Position or UDim2.new(0,0,0,0)
    Img.BackgroundTransparency = 1
    Img.Image = info.Image or ""
    Img.Parent = parent

    self.Instance = Img
    self.UpdateTheme = function(theme) end

    return self
end

return ZiaanImage
