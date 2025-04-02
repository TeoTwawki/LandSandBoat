-----------------------------------
-- invaderXim.effect.SLUGGISH_DAZE_4
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.DEFP, -11)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.DEFP, -11)
end

return effectObject
