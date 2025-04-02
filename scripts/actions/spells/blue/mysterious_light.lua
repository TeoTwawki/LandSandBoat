-----------------------------------
-- Spell: Mysterious Light
-- Deals wind damage to enemies within range. Additional effect: Weight
-- Spell cost: 73 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI+3
-- Level: 40
-- Casting Time: 3.75 seconds
-- Recast Time: 24.5 seconds
-- Magic Bursts on: Detonation, Fragmentation, Light
-- Combos: Max MP Boost
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.ARCANA
    params.attackType = invaderXim.attackType.MAGICAL
    params.damageType = invaderXim.damageType.WIND
    params.attribute = invaderXim.mod.CHR
    params.multiplier = 2.0
    params.tMultiplier = 1.0
    params.duppercap = 56
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.3

    params.addedEffect = invaderXim.effect.WEIGHT
    local power = 25
    local tick = 0
    local duration = 60

    local damage = invaderXim.spells.blue.useMagicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
