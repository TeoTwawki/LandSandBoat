-----------------------------------
-- invaderXim.effect.PLAGUE
-- Plague is a harmful status effect that reduces a character's TP and MP over time.
-- Also, causes Steps to only grant One Finishing Move when Main Job is Dancer.
-- Normal power is 5.
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.REFRESH_DOWN, math.ceil(effect:getPower() / 2))
    target:addMod(invaderXim.mod.REGAIN_DOWN, effect:getPower() * 10)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.REFRESH_DOWN, math.ceil(effect:getPower() / 2))
    target:delMod(invaderXim.mod.REGAIN_DOWN, effect:getPower() * 10)
end

return effectObject
