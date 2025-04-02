-----------------------------------
-- invaderXim.effect.PROWESS
-- Enhanced "Cure" potency
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CURE_POTENCY, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CURE_POTENCY, effect:getPower())
end

return effectObject
