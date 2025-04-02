-----------------------------------
-- Spell: Doton: San
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 15 + caster:getMerit(invaderXim.merit.DOTON_EFFECT) -- T1 bonus debuff duration
    target:addStatusEffectEx(invaderXim.effect.NINJUTSU_ELE_DEBUFF, 0, 30, 0, duration, 0, invaderXim.mod.WIND_MEVA, 0)

    return invaderXim.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
