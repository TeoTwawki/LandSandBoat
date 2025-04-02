-----------------------------------
-- invaderXim.effect.WARDING_CIRCLE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.WARDING_CIRCLE_EFFECT)

    target:addMod(invaderXim.mod.DEMON_KILLER, effect:getPower() + jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.WARDING_CIRCLE_EFFECT)

    target:delMod(invaderXim.mod.DEMON_KILLER, effect:getPower() + jpValue)
end

return effectObject
