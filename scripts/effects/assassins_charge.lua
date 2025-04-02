-----------------------------------
-- invaderXim.effect.ASSASSINS_CHARGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.QUAD_ATTACK, effect:getPower())
    effect:addMod(invaderXim.mod.TRIPLE_ATTACK, 100)
    effect:addMod(invaderXim.mod.CRITHITRATE, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
