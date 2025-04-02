-----------------------------------
-- invaderXim.effect.ASYLUM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- TODO: Audit power and add Job point effect
    effect:addMod(invaderXim.mod.SLEEP_MEVA, 98)
    effect:addMod(invaderXim.mod.POISON_MEVA, 98)
    effect:addMod(invaderXim.mod.PARALYZE_MEVA, 98)
    effect:addMod(invaderXim.mod.BLIND_MEVA, 98)
    effect:addMod(invaderXim.mod.SILENCE_MEVA, 98)
    effect:addMod(invaderXim.mod.VIRUS_MEVA, 98)
    effect:addMod(invaderXim.mod.PETRIFY_MEVA, 98)
    effect:addMod(invaderXim.mod.BIND_MEVA, 98)
    effect:addMod(invaderXim.mod.CURSE_MEVA, 98)
    effect:addMod(invaderXim.mod.GRAVITY_MEVA, 98)
    effect:addMod(invaderXim.mod.SLOW_MEVA, 98)
    effect:addMod(invaderXim.mod.STUN_MEVA, 98)
    effect:addMod(invaderXim.mod.CHARM_MEVA, 98)
    effect:addMod(invaderXim.mod.AMNESIA_MEVA, 98)
    effect:addMod(invaderXim.mod.LULLABY_MEVA, 98)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
