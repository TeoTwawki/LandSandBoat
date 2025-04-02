-----------------------------------
--  Rime Spray
--  Description: Deals Ice damage to enemies within a fan-shaped area, inflicting them with Frost and All statuses down.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 5

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.ICE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.FROST, 15, 3, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.STR_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.VIT_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEX_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AGI_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MND_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.INT_DOWN, 20, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CHR_DOWN, 20, 3, 60)

    return damage
end

return mobskillObject
