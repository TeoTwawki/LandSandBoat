-----------------------------------
-- Spell: Blood Saber
-- Steals HP from enemies within range. Ineffective against undead
-- Spell cost: 25 MP
-- Monster Type: Undead
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 48
-- Casting Time: 4 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.UNDEAD
    params.attackType = invaderXim.attackType.MAGICAL
    params.damageType = invaderXim.damageType.DARK
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.dmgMultiplier = 3.5

    return invaderXim.spells.blue.useDrainSpell(caster, target, spell, params, 0, false)
end

return spellObject
