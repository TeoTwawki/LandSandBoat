-----------------------------------
-- Empirical Research
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2.8

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.NONE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.NONE, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    target:takeDamage(damage, mob, invaderXim.attackType.NONE, invaderXim.damageType.NONE)

    return damage
end

return mobskillObject
