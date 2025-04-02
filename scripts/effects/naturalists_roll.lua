-----------------------------------
-- invaderXim.effect.NATURALISTS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ENH_MAGIC_DURATION, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ENH_MAGIC_DURATION, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
