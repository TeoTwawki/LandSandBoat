-----------------------------------
-- invaderXim.effect.FLEE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.MOVE_SPEED_FLEE, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
