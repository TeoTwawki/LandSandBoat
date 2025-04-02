-----------------------------------
-- invaderXim.effect.DEFENDER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.DEFENDER_EFFECT)

    target:addMod(invaderXim.mod.DEFP, 25)
    target:addMod(invaderXim.mod.RATTP, -25)
    target:addMod(invaderXim.mod.ATTP, -25)

    -- JP Bonus
    target:addMod(invaderXim.mod.DEF, jpLevel * 3)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(invaderXim.jp.DEFENDER_EFFECT)

    target:delMod(invaderXim.mod.DEF, jpLevel * 3)
    target:delMod(invaderXim.mod.DEFP, 25)
    target:delMod(invaderXim.mod.ATTP, -25)
    target:delMod(invaderXim.mod.RATTP, -25)
end

return effectObject
