-----------------------------------
-- Spell: Magnetite Cloud
-- Deals earth damage to enemies within a fan-shaped area originating from the caster. Additional effect: Weight
-- Spell cost: 86 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+2
-- Level: 46
-- Casting Time: 4.5 seconds
-- Recast Time: 29.25 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Magic Defense Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = invaderXim.ecosystem.BEASTMEN
    params.attackType = invaderXim.attackType.BREATH
    params.damageType = invaderXim.damageType.EARTH
    params.diff = 0 -- no stat increases magic accuracy
    params.skillType = invaderXim.skill.BLUE_MAGIC
    params.hpMod = 6
    params.lvlMod = 1.875

    local results = invaderXim.spells.blue.useBreathSpell(caster, target, spell, params, true)
    local damage = results[1]
    local resist = results[2]

    if resist >= 0.5 then
        target:addStatusEffect(invaderXim.effect.WEIGHT, 25, 0, 60 * resist)
    end

    return damage
end

return spellObject
