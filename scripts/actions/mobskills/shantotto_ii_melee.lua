-----------------------------------
--  Shantotto II Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg()

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.NONE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE)
    skill:setMsg(invaderXim.msg.basic.HIT_DMG)

    return damage
end

return mobskillObject
