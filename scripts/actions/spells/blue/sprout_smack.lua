-----------------------------------
-- Spell: Sprout Smack
-- Additional effect: Slow. Duration of effect varies with TP
-- Spell cost: 6 MP
-- Monster Type: Plantoids
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 2
-- Stat Bonus: MND+1
-- Level: 4
-- Casting Time: 0.5 seconds
-- Recast Time: 7.25 seconds
-- Skillchain property: Reverberation
-- Combos: Beast Killer
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.PLANTOID
    params.tpmod = invaderXim.spells.blue.tpMod.DURATION
    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.BLUNT
    params.scattr = invaderXim.skillchainType.REVERBERATION
    params.numhits = 1
    params.multiplier = 1.5
    params.tp150 = 1.5
    params.tp300 = 1.5
    params.azuretp = 1.5
    params.duppercap = 11
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.3
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.effect = invaderXim.effect.SLOW
    local power = 1500
    local tick = 0
    local duration = 180

    local damage = invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject
