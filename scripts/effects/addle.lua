-----------------------------------
-- invaderXim.effect.ADDLE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.FASTCAST, -effect:getPower()) -- Yes we are subtracting in addMod()
    effect:addMod(invaderXim.mod.MACC, -effect:getSubPower()) -- This is intentional

    -- Immunobreak reset.
    target:setMod(invaderXim.mod.ADDLE_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
