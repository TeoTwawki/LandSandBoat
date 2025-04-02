-----------------------------------
-- invaderXim.effect.HAGAKURE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.HAGAKURE_EFFECT)

    target:addMod(invaderXim.mod.SAVETP, 400)
    target:addMod(invaderXim.mod.TP_BONUS, 1000 + (jpValue * 10))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.HAGAKURE_EFFECT)

    target:delMod(invaderXim.mod.SAVETP, 400)
    target:delMod(invaderXim.mod.TP_BONUS, 1000 + (jpValue * 10))
end

return effectObject
