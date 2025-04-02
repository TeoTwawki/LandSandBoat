-----------------------------------
--  Mysterious Light
--  Description: Deals wind damage to enemies within range. Additional effect: Weight.
--  Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 3.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 60)

    return damage
end

return mobskillObject
