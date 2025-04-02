-----------------------------------
-- invaderXim.effect.SUBTLE_SORCERY
-----------------------------------
---@type TEffect
local effectObject = {}

-- Spell Cumulative Enmity reduction handled in magic_state.cpp
effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SUBTLE_SORCERY_EFFECT)

    target:addMod(invaderXim.mod.MACC, 100)
    target:addMod(invaderXim.mod.UFASTCAST, jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(invaderXim.jp.SUBTLE_SORCERY_EFFECT)

    target:delMod(invaderXim.mod.MACC, 100)
    target:delMod(invaderXim.mod.UFASTCAST, jpValue)
end

return effectObject
