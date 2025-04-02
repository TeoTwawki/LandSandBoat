-----------------------------------
-- Spell: Enblizzard II
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.spells.enhancing.useEnhancingSpell(caster, target, spell)
end

return spellObject
