-----------------------------------
-- invaderXim.effect.INNER_STRENGTH
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HPP, 100)
    target:addMod(invaderXim.mod.PERFECT_COUNTER_ATT, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HPP, 100)
    target:delMod(invaderXim.mod.PERFECT_COUNTER_ATT, 100)
end

return effectObject
