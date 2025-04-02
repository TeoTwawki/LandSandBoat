-----------------------------------
-- invaderXim.effect.MIGHTY_STRIKES
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.MIGHTY_STRIKES_EFFECT)

    target:addMod(invaderXim.mod.CRITHITRATE, 100)
    target:addMod(invaderXim.mod.ACC, jpLevel * 2)
    target:addMod(invaderXim.mod.RACC, jpLevel * 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.MIGHTY_STRIKES_EFFECT)

    target:addMod(invaderXim.mod.CRITHITRATE, -100)
    target:delMod(invaderXim.mod.ACC, jpLevel * 2)
    target:delMod(invaderXim.mod.RACC, jpLevel * 2)
end

return effectObject
