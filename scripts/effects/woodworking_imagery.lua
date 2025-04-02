-----------------------------------
-- invaderXim.effect.WOODWORKING_IMAGERY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.WOOD, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.WOOD, effect:getPower())
end

return effectObject
