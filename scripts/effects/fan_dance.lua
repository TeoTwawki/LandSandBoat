-----------------------------------
-- invaderXim.effect.FAN_DANCE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(invaderXim.effect.HASTE_SAMBA)
    target:delStatusEffect(invaderXim.effect.ASPIR_SAMBA)
    target:delStatusEffect(invaderXim.effect.DRAIN_SAMBA)
    target:delStatusEffect(invaderXim.effect.SABER_DANCE)
    target:addMod(invaderXim.mod.ENMITY, 15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.ENMITY, 15)
end

return effectObject
