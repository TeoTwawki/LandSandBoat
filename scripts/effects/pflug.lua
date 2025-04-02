-----------------------------------
-- invaderXim.effect.PFLUG
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.job_utils.rune_fencer.onPflugEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.job_utils.rune_fencer.onPflugEffectLose(target, effect)
end

return effectObject
