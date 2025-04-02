-----------------------------------
-- invaderXim.effect.FLURRY_II
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Overwrites regular Haste Effect
    target:delStatusEffect(invaderXim.effect.HASTE)

    effect:addMod(invaderXim.mod.SNAPSHOT, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
