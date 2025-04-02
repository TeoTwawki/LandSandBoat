-----------------------------------
-- invaderXim.effect.DIVINE_CARESS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(invaderXim.mod.SLEEP_MEVA, 98)
    target:addMod(invaderXim.mod.POISON_MEVA, 98)
    target:addMod(invaderXim.mod.PARALYZE_MEVA, 98)
    target:addMod(invaderXim.mod.BLIND_MEVA, 98)
    target:addMod(invaderXim.mod.SILENCE_MEVA, 98)
    target:addMod(invaderXim.mod.VIRUS_MEVA, 98)
    target:addMod(invaderXim.mod.PETRIFY_MEVA, 98)
    target:addMod(invaderXim.mod.BIND_MEVA, 98)
    target:addMod(invaderXim.mod.CURSE_MEVA, 98)
    target:addMod(invaderXim.mod.GRAVITY_MEVA, 98)
    target:addMod(invaderXim.mod.SLOW_MEVA, 98)
    target:addMod(invaderXim.mod.STUN_MEVA, 98)
    target:addMod(invaderXim.mod.CHARM_MEVA, 98)
    target:addMod(invaderXim.mod.AMNESIA_MEVA, 98)
    target:addMod(invaderXim.mod.LULLABY_MEVA, 98)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(invaderXim.mod.SLEEP_MEVA, 98)
    target:delMod(invaderXim.mod.POISON_MEVA, 98)
    target:delMod(invaderXim.mod.PARALYZE_MEVA, 98)
    target:delMod(invaderXim.mod.BLIND_MEVA, 98)
    target:delMod(invaderXim.mod.SILENCE_MEVA, 98)
    target:delMod(invaderXim.mod.VIRUS_MEVA, 98)
    target:delMod(invaderXim.mod.PETRIFY_MEVA, 98)
    target:delMod(invaderXim.mod.BIND_MEVA, 98)
    target:delMod(invaderXim.mod.CURSE_MEVA, 98)
    target:delMod(invaderXim.mod.GRAVITY_MEVA, 98)
    target:delMod(invaderXim.mod.SLOW_MEVA, 98)
    target:delMod(invaderXim.mod.STUN_MEVA, 98)
    target:delMod(invaderXim.mod.CHARM_MEVA, 98)
    target:delMod(invaderXim.mod.AMNESIA_MEVA, 98)
    target:delMod(invaderXim.mod.LULLABY_MEVA, 98)
end

return effectObject
