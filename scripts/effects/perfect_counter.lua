-----------------------------------
-- invaderXim.effect.PERFECT_COUNTER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.PERFECT_COUNTER_ATT, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.PERFECT_COUNTER_ATT, 100)
end

return effectObject
