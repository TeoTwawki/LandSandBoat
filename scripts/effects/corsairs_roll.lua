-----------------------------------
-- invaderXim.effect.CORSAIRS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.EXP_BONUS, effect:getPower())
    target:addMod(invaderXim.mod.CAPACITY_BONUS, effect:getPower())
    -- TODO: Exemplar Points (Not Implemented)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.EXP_BONUS, effect:getPower())
    target:delMod(invaderXim.mod.CAPACITY_BONUS, effect:getPower())
    -- TODO: Exemplar Points (Not Implemented)
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
