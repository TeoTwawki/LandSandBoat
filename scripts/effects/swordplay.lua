-----------------------------------
-- invaderXim.effect.SWORDPLAY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    invaderXim.job_utils.rune_fencer.onSwordplayEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
    invaderXim.job_utils.rune_fencer.onSwordplayEffectTick(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    invaderXim.job_utils.rune_fencer.onSwordplayEffectLose(target, effect)
end

return effectObject
