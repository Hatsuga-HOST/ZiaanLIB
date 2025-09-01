-- extras/particlepreview.lua
local ParticlePreview = {}

function ParticlePreview:Preview(particleEmitter, parent)
    local clone = particleEmitter:Clone()
    clone.Parent = parent
    clone.Enabled = true
    return clone
end

function ParticlePreview:Stop(clone)
    if clone then
        clone.Enabled = false
        clone:Destroy()
    end
end

return ParticlePreview
