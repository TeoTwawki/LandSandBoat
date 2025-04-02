-----------------------------------
-- Spell: Smite of Rage
-- Damage varies with TP
-- Spell cost: 28 MP
-- Monster Type: Arcana
-- Spell Type: Physical (Slashing)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+3
-- Level: 34
-- Casting Time: 0.5 seconds
-- Recast Time: 13 seconds
-- Skillchain Element(s): Detonation
-- Combos: Undead Killer
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.ARCANA
    params.tpmod = invaderXim.spells.blue.tpMod.DAMAGE
    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.SLASHING
    params.scattr = invaderXim.skillchainType.DETONATION
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 2.25
    params.tp300 = 2.5
    params.azuretp = 2.53125
    params.duppercap = 35
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.ignorefstrcap = true -- Smite of Rage doesn't have an fSTR cap

    return invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
