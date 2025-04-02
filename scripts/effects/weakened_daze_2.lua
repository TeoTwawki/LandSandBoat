-----------------------------------
-- invaderXim.effect.WEAKENED_DAZE_2
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MEVA, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MEVA, -15)
end

return effectObject
