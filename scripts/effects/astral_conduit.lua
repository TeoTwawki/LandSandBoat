-----------------------------------
-- invaderXim.effect.ASTRAL_CONDUIT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(invaderXim.mod.BP_DELAY, 99)
    effect:addMod(invaderXim.mod.MPP, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
