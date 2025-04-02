-----------------------------------
-- invaderXim.effect.UNLIMITED_SHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.UNLIMITED_SHOT_EFFECT)

    target:addMod(invaderXim.mod.ENMITY, -2 * jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.UNLIMITED_SHOT_EFFECT)

    target:delMod(invaderXim.mod.ENMITY, -2 * jpValue)
end

return effectObject
