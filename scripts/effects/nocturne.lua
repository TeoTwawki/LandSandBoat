-----------------------------------
-- invaderXim.effect.NOCTURNE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()

    effect:addMod(invaderXim.mod.FASTCAST, -power)
    effect:addMod(invaderXim.mod.MACC, -power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
