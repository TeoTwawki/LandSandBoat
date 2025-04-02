-----------------------------------
-- Spell: Sandspin
-- Deals earth damage to enemies within range. Additional Effect: Accuracy Down
-- Spell cost: 10 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 1
-- Casting Time: 1.5 seconds
-- Recast Time: 9.75 seconds
-- Magic Bursts on: Scission, Gravitation, Darkness
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
    params.damageType = invaderXim.damageType.EARTH
    params.attribute = invaderXim.mod.INT
    params.multiplier = 1.0
    params.tMultiplier = 1.0
    params.duppercap = 13
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    params.addedEffect = invaderXim.effect.ACCURACY_DOWN
    local power = 25
    local tick = 0
    local duration = 60

    local damage = invaderXim.spells.blue.useMagicalSpell(caster, target, spell, params)
    invaderXim.spells.blue.useMagicalSpellAddedEffect(caster, target, spell, params, power, tick, duration)

    return damage
end

return spellObject
