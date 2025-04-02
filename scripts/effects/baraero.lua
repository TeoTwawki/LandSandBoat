-----------------------------------
-- invaderXim.effect.BARAERO
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.WIND_MEVA, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.WIND_MEVA, effect:getPower())
end

return effectObject
