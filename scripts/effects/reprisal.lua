-----------------------------------
-- invaderXim.effect.REPRISAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SPIKES, 6)
    -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(invaderXim.mod.SPIKES_DMG, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SPIKES, 6)
    target:setMod(invaderXim.mod.SPIKES_DMG, 0)
end

return effectObject
