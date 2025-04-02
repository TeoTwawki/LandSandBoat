-----------------------------------
-- invaderXim.effect.PUPPET_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addPetMod(invaderXim.mod.MATT, effect:getPower())
    target:addPetMod(invaderXim.mod.MACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delPetMod(invaderXim.mod.MATT, effect:getPower())
    target:delPetMod(invaderXim.mod.MACC, effect:getPower())
    invaderXim.job_utils.corsair.onRollEffectLose(target, effect)
end

return effectObject
