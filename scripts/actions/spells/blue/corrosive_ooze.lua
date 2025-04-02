-----------------------------------
-- Spell: Corrosive Ooze
-- Deals water damage to an enemy. Additional Effect: Attack Down and Defense Down
-- Spell cost: 55 MP
-- Monster Type: Amorphs
-- Spell Type: Magical (Water)
-- Blue Magic Points: 4
-- Stat Bonus: HP-10 MP+10
-- Level: 66
-- Casting Time: 5 seconds
-- Recast Time: 30 seconds
-----------------------------------
-- Combos: Clear Mind
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
    params.damageType = invaderXim.damageType.WATER
    params.attribute = invaderXim.mod.INT
    params.multiplier = 2.125
    params.azureBonus = 0.5
    params.tMultiplier = 2.0
    params.duppercap = 69
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local damage = invaderXim.spells.blue.useMagicalSpell(caster, target, spell, params)

    params.attribute = invaderXim.mod.INT
    params.skillType = invaderXim.skill.BLUE_MAGIC
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then
        target:addStatusEffect(invaderXim.effect.DEFENSE_DOWN, 5, 0, 90 * resist)
        target:addStatusEffect(invaderXim.effect.ATTACK_DOWN, 5, 0, 90 * resist)
    end

    return damage
end

return spellObject
