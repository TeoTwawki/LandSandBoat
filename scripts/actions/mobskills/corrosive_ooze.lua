-----------------------------------
--  Corrosive Ooze
--  Family: Slugs
--  Description: Deals water damage to an enemy. Additional Effect: Attack Down and Defense Down.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Radial
--  Notes:
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4.2

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.ATTACK_DOWN, 15, 0, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 15, 0, 120)

    return damage
end

return mobskillObject
