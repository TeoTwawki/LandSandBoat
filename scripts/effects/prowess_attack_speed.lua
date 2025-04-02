-----------------------------------
-- invaderXim.effect.PROWESS
-- Increased attack speed
-- Note: Doesn't alter TP gain like -delay would, and
-- doesn't alter JA timers like other sources of haste.
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HASTE_ABILITY, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HASTE_ABILITY, effect:getPower())
end

return effectObject
