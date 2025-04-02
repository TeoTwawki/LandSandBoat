-----------------------------------
-- invaderXim.effect.HEALERS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.CURE_POTENCY_RCVD, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.CURE_POTENCY_RCVD, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
