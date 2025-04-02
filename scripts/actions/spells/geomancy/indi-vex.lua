-----------------------------------
-- Spell: Indi-Vex
-- Reduces magic accuracy of enemies near the caster.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.job_utils.geomancer.indiOnMagicCastingCheck(caster, target, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return invaderXim.job_utils.geomancer.doIndiSpell(caster, target, spell)
end

return spellObject
