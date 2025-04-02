-----------------------------------
-- invaderXim.effect.ARROW_SHIELD
-- Blocks all ranged attacks
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.UDMGRANGE, -10000)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
