-----------------------------------
-- invaderXim.effect.WEIGHT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, effect:getPower())

    -- Immunobreak reset.
    target:setMod(invaderXim.mod.GRAVITY_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, effect:getPower())
end

return effectObject
