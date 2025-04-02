-----------------------------------
-- invaderXim.effect.DIABOLIC_EYE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.ACC, effect:getPower())
    effect:addMod(invaderXim.mod.HPP, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
