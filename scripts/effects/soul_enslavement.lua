-----------------------------------
-- invaderXim.effect.SOUL_ENSLAVEMENT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:delStatusEffectSilent(invaderXim.effect.AUSPICE)
    target:delStatusEffectSilent(invaderXim.effect.ENSTONE)
    target:delStatusEffectSilent(invaderXim.effect.ENSTONE_II)
    target:delStatusEffectSilent(invaderXim.effect.ENWATER)
    target:delStatusEffectSilent(invaderXim.effect.ENWATER_II)
    target:delStatusEffectSilent(invaderXim.effect.ENAERO)
    target:delStatusEffectSilent(invaderXim.effect.ENAERO_II)
    target:delStatusEffectSilent(invaderXim.effect.ENFIRE)
    target:delStatusEffectSilent(invaderXim.effect.ENFIRE_II)
    target:delStatusEffectSilent(invaderXim.effect.ENBLIZZARD)
    target:delStatusEffectSilent(invaderXim.effect.ENBLIZZARD_II)
    target:delStatusEffectSilent(invaderXim.effect.ENTHUNDER)
    target:delStatusEffectSilent(invaderXim.effect.ENTHUNDER_II)
    target:delStatusEffectSilent(invaderXim.effect.ENLIGHT)
    target:delStatusEffectSilent(invaderXim.effect.ENDARK)

    effect:addMod(invaderXim.mod.ENSPELL, 22)
    effect:addMod(invaderXim.mod.ENSPELL_DMG, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
