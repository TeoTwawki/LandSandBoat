-----------------------------------
-- invaderXim.effect.VALLATION
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.job_utils.rune_fencer.onVallationValianceEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.job_utils.rune_fencer.onVallationValianceEffectLose(target, effect)
end

return effectObject
