-----------------------------------
-- invaderXim.effect.HUNTERS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, effect:getPower())
    target:addMod(invaderXim.mod.RACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, effect:getPower())
    target:delMod(invaderXim.mod.RACC, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
