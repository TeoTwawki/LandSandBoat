-----------------------------------
-- invaderXim.effect.UNDA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.FIRE_MEVA, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.FIRE_MEVA, effect:getPower())
end

return effectObject
