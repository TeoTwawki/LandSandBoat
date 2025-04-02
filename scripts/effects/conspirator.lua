-----------------------------------
-- invaderXim.effect.CONSPIRATOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CONSPIRATOR_EFFECT)

    target:addMod(invaderXim.mod.SUBTLE_BLOW, effect:getPower())
    target:addMod(invaderXim.mod.ACC, effect:getSubPower() + jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CONSPIRATOR_EFFECT)

    target:delMod(invaderXim.mod.SUBTLE_BLOW, effect:getPower())
    target:delMod(invaderXim.mod.ACC, effect:getSubPower() + jpValue)
end

return effectObject
