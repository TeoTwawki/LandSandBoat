-----------------------------------
-- invaderXim.effect.CHAINSPELL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CHAINSPELL_EFFECT)

    target:addMod(invaderXim.mod.UFASTCAST, 150)
    target:addMod(invaderXim.mod.MAGIC_DAMAGE, jpValue * 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.CHAINSPELL_EFFECT)

    target:delMod(invaderXim.mod.UFASTCAST, 150)
    target:delMod(invaderXim.mod.MAGIC_DAMAGE, jpValue * 2)
end

return effectObject
