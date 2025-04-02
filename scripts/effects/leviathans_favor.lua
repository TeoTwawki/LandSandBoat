-----------------------------------
-- invaderXim.effect.LEVIATHANS_FAVOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.MACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.MACC, effect:getPower())
end

return effectObject
