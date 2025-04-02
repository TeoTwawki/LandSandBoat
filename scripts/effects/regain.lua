-----------------------------------
-- invaderXim.effect.REGAIN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.REGAIN, effect:getPower() * 10)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.REGAIN, effect:getPower() * 10)
end

return effectObject
