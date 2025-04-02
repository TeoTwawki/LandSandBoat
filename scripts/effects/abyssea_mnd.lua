-----------------------------------
-- invaderXim.effect.ABYSSEA_MND
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.MND, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
