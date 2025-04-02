-----------------------------------
-- invaderXim.effect.SHOCK_SPIKES
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SPIKES, 5)
    target:addMod(invaderXim.mod.SPIKES_DMG, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SPIKES, 5)
    target:delMod(invaderXim.mod.SPIKES_DMG, effect:getPower())
end

return effectObject
