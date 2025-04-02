-----------------------------------
-- invaderXim.effect.OVERKILL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DOUBLE_SHOT_RATE, 100)
    target:addMod(invaderXim.mod.TRIPLE_ATTACK, 33)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DOUBLE_SHOT_RATE, 100)
    target:delMod(invaderXim.mod.TRIPLE_ATTACK, 33)
end

return effectObject
