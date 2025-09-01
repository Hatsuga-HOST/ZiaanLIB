-- math.lua (ZiaanLIB utils)
local MathUtil = {}

-- Linear interpolation
function MathUtil:Lerp(a, b, t)
    return a + (b - a) * t
end

-- Clamp value
function MathUtil:Clamp(val, min, max)
    return math.max(min, math.min(max, val))
end

-- Map value from one range to another
function MathUtil:Map(value, inMin, inMax, outMin, outMax)
    return outMin + (value - inMin) * (outMax - outMin) / (inMax - inMin)
end

return MathUtil
