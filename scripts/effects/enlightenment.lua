-----------------------------------
-- invaderXim.effect.ENLIGHTENMENT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.INT, effect:getPower())
    target:addMod(invaderXim.mod.MND, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.INT, effect:getPower())
    target:delMod(invaderXim.mod.MND, effect:getPower())
end

return effectObject
