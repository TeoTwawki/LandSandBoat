-----------------------------------
-- invaderXim.effect.MAJESTY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local strength = effect:getPower()

    target:addMod(invaderXim.mod.CURE_POTENCY_II, strength)
    target:addMod(invaderXim.mod.WHITE_MAGIC_RECAST, -strength)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local strength = effect:getPower()

    target:delMod(invaderXim.mod.CURE_POTENCY_II, strength)
    target:delMod(invaderXim.mod.WHITE_MAGIC_RECAST, -strength)
end

return effectObject
