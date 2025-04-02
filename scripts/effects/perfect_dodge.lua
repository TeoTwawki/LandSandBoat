-----------------------------------
-- invaderXim.effect.PERFECT_DODGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.PERFECT_DODGE_EFFECT)
    target:addMod(invaderXim.mod.MEVA, jpValue * 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.PERFECT_DODGE_EFFECT)
    target:delMod(invaderXim.mod.MEVA, jpValue * 3)
end

return effectObject
