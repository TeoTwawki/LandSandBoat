-----------------------------------
-- invaderXim.effect.PROWESS
-- From GoV
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.GOV_CLEARS, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.GOV_CLEARS, effect:getPower())
end

return effectObject
