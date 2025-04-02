-----------------------------------
-- invaderXim.effect.CURSE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(invaderXim.mod.CURSE_PCT, -effect:getPower())
    target:addMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    --restore HP and MP to its former state.
    target:delMod(invaderXim.mod.CURSE_PCT, -effect:getPower())
    target:delMod(invaderXim.mod.MOVE_SPEED_WEIGHT_PENALTY, effect:getPower())
end

return effectObject
