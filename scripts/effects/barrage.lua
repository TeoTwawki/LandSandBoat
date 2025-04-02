-----------------------------------
-- invaderXim.effect.BARRAGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.BARRAGE_EFFECT)

    target:addMod(invaderXim.mod.RATT, jpValue * 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.BARRAGE_EFFECT)

    target:delMod(invaderXim.mod.RATT, jpValue * 3)
end

return effectObject
