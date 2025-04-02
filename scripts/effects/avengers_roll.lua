-----------------------------------
-- invaderXim.effect.AVENGERS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.COUNTER, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
