-----------------------------------
-- invaderXim.effect.SLUGGISH_DAZE_5
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEFP, -13)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEFP, -13)
end

return effectObject
