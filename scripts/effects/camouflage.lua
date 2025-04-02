-----------------------------------
-- invaderXim.effect.CAMOUFLAGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CAMOUFLAGE_EFFECT)

    target:addMod(invaderXim.mod.ENMITY, -25)
    target:addMod(invaderXim.mod.CRITHITRATE, jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CAMOUFLAGE_EFFECT)

    target:delMod(invaderXim.mod.ENMITY, -25)
    target:delMod(invaderXim.mod.CRITHITRATE, jpValue)
end

return effectObject
