-----------------------------------
--  Cold Wave
--  Description: Deals ice damage that lowers Agility and gradually reduces HP of enemies within range.
--  Type: Magical (Ice)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2.8
    local power  = mob:getMainLvl() / 5 * 0.6 + 6

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.ICE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.FROST, power, 3, 60)

    return damage
end

return mobskillObject
