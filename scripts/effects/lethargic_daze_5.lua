-----------------------------------
-- invaderXim.effect.LETHARGIC_DAZE_5
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.EVA, -24)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.EVA, -24)
end

return effectObject
