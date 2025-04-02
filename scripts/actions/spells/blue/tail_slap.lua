-----------------------------------
-- Spell: Tail Slap
-- Delivers an area attack. Additional effect: "Stun." Damage varies with TP
-- Spell cost: 77 MP
-- Monster Type: Beastmen
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 4
-- Stat Bonus: MND+2
-- Level: 69
-- Casting Time: 1 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element: Reverberation
-- Combos: Store TP
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEASTMEN
    params.tpmod = invaderXim.spells.blue.tpMod.ATTACK
    params.attackType = invaderXim.attackType.PHYSICAL
    params.damageType = invaderXim.damageType.HTH
    params.scattr = invaderXim.skillchainType.REVERBERATION
    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.numhits = 1
    params.multiplier = 1.625
    params.tp150 = 1.625
    params.tp300 = 1.625
    params.azuretp = 1.625
    params.duppercap = 75
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.5
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.effect = invaderXim.effect.STUN
    local power = 1
    local tick = 0
    local duration = 5

    local damage = invaderXim.spells.blue.usePhysicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.usePhysicalSpellAddedEffect(caster, target, spell, params, damage, power, tick, duration)

    return damage
end

return spellObject
