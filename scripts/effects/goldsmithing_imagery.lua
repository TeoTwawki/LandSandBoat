-----------------------------------
-- invaderXim.effect.GOLDSMITHING_IMAGERY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.GOLDSMITH, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.GOLDSMITH, effect:getPower())
end

return effectObject
