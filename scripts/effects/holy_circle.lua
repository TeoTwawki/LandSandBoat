-----------------------------------
-- invaderXim.effect.HOLY_CIRCLE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.UNDEAD_KILLER, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.UNDEAD_KILLER, effect:getPower())
end

return effectObject
