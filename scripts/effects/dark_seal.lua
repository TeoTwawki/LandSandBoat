-----------------------------------
-- invaderXim.effect.DARK_SEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Overwrites
    target:delStatusEffectSilent(invaderXim.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(invaderXim.effect.DIVINE_SEAL)
    target:delStatusEffectSilent(invaderXim.effect.ELEMENTAL_SEAL)

    effect:addMod(invaderXim.mod.DARK_MAGIC_CAST, -effect:getPower())
    effect:addMod(invaderXim.mod.DARK_MAGIC_DURATION, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
