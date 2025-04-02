-----------------------------------
-- invaderXim.effect.DREAD_SPIKES
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SPIKES, 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SPIKES, 3)
end

return effectObject
