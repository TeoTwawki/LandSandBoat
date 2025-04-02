-----------------------------------
-- invaderXim.effect.MAGUSS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MDEF, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MDEF, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
