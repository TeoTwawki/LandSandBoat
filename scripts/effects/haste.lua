-----------------------------------
-- invaderXim.effect.HASTE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Overwrites regular Flurry Effect
    target:delStatusEffect(invaderXim.effect.FLURRY_II)

    effect:addMod(invaderXim.mod.HASTE_MAGIC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
