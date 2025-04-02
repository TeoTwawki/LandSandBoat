-----------------------------------
-- invaderXim.effect.WARRIORS_CHARGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.TRIPLE_ATTACK, effect:getPower())
    target:addMod(invaderXim.mod.DOUBLE_ATTACK, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.TRIPLE_ATTACK, effect:getPower())
    target:delMod(invaderXim.mod.DOUBLE_ATTACK, 100)
end

return effectObject
