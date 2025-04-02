-----------------------------------
-- Spell: Heat Breath
-- Deals fire damage to enemies within a fan-shaped area originating from the caster
-- Spell cost: 169 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 4
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 7.5 seconds
-- Recast Time: 49 seconds
-- Magic Bursts on: Liquefaction, Fusion, Light
-- Combos: Magic Attack Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEAST
    params.attackType = invaderXim.attackType.BREATH
    params.damageType = invaderXim.damageType.FIRE
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.hpMod = 2
    params.lvlMod = 0

    local results = invaderXim.spells.blue.useBreathSpell(caster, target, spell, params, true)
    local damage = results[1]

    return damage
end

return spellObject
