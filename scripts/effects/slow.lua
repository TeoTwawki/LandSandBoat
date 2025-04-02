-----------------------------------
-- invaderXim.effect.SLOW
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HASTE_MAGIC, -effect:getPower())

    -- Immunobreak reset.
    target:setMod(invaderXim.mod.SLOW_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HASTE_MAGIC, -effect:getPower())
end

return effectObject
