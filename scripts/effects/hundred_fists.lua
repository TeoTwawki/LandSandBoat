-----------------------------------
-- invaderXim.effect.HUNDRED_FISTS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.HUNDRED_FISTS_EFFECT)
    target:addMod(invaderXim.mod.ACC, jpLevel * 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.HUNDRED_FISTS_EFFECT)
    target:delMod(invaderXim.mod.ACC, jpLevel * 2)
end

return effectObject
