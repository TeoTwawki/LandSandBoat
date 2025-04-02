-----------------------------------
-- invaderXim.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.AGGRESSOR_EFFECT)

    effect:addMod(invaderXim.mod.RACC, effect:getPower() + jpLevel)
    effect:addMod(invaderXim.mod.ACC, 25 + jpLevel)
    effect:addMod(invaderXim.mod.EVA, -25)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
