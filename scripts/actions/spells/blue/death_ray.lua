-----------------------------------
-- Spell: Death Ray
-- Deals dark damage to an enemy
-- Spell cost: 49 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5, MP+5
-- Level: 34
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
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
    params.ecosystem = invaderXim.ecosystem.AMORPH
    params.attackType = invaderXim.attackType.MAGICAL
    params.damageType = invaderXim.damageType.DARK
    params.attribute = invaderXim.mod.INT
    params.multiplier = 1.625
    params.azureBonus = 2
    params.tMultiplier = 1.0
    params.duppercap = 51
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.1
    params.chr_wsc = 0.0

    return invaderXim.spells.blue.useMagicalSpell(caster, target, spell, params)
end

return spellObject
