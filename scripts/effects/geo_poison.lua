-----------------------------------
-- invaderXim.effect.GEO_POISON
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.REGEN_DOWN, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.REGEN_DOWN, effect:getPower())
end

return effectObject
