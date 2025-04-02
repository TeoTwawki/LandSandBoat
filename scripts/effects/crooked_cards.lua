-----------------------------------
-- invaderXim.effect.CROOKED_CARDS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.PHANTOM_ROLL, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.PHANTOM_ROLL, 100)
end

return effectObject
