-----------------------------------
-- invaderXim.effect.CHAOS_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.ATTP, effect:getPower())
    target:addMod(invaderXim.mod.RATTP, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ATTP, effect:getPower())
    target:delMod(invaderXim.mod.RATTP, effect:getPower())
end

return effectObject
