-----------------------------------
-- Effect: GEO Accuracy Boost
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ACC, effect:getPower())
    target:addMod(invaderXim.mod.RACC, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ACC, effect:getPower())
    target:delMod(invaderXim.mod.RACC, effect:getPower())
end

return effectObject
