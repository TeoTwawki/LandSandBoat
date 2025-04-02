-----------------------------------
-- Spell: Geo-Vex
-- Reduces magic accuracy for enemies within area of effect.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return invaderXim.job_utils.geomancer.geoOnMagicCastingCheck(caster, target, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    invaderXim.job_utils.geomancer.spawnLuopan(caster, target, spell)
end

return spellObject
