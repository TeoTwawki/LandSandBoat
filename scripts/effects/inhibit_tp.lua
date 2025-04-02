-----------------------------------
-- invaderXim.effect.INHIBIT_TP
-- Reduces TP Gain By a % Factor
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INHIBIT_TP, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INHIBIT_TP, effect:getPower())
end

return effectObject
