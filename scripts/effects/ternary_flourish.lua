-----------------------------------
-- invaderXim.effect.TERNARY_FLOURISH
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.TRIPLE_ATTACK, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.TRIPLE_ATTACK, 100)
end

return effectObject
