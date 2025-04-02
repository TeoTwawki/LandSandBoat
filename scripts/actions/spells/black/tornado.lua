-----------------------------------
-- Spell: Tornado
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    target:addStatusEffectEx(invaderXim.effect.NINJUTSU_ELE_DEBUFF, 0, 30, 0, 10, 0, invaderXim.mod.ICE_MEVA, 0)

    return invaderXim.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
