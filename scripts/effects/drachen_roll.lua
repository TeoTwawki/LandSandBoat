-----------------------------------
-- invaderXim.effect.DRACHEN_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addPetMod(invaderXim.mod.ACC, effect:getPower())
    target:addPetMod(invaderXim.mod.RACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delPetMod(invaderXim.mod.ACC, effect:getPower())
    target:delPetMod(invaderXim.mod.RACC, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
