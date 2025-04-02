-----------------------------------
--  Effect: Geo-Haste
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.HASTE_MAGIC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.HASTE_MAGIC, effect:getPower())
end

return effectObject
