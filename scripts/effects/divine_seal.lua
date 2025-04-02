-----------------------------------
-- invaderXim.effect.DIVINE_SEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Overwrites
    target:delStatusEffectSilent(invaderXim.effect.DARK_SEAL)
    target:delStatusEffectSilent(invaderXim.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(invaderXim.effect.ELEMENTAL_SEAL)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
