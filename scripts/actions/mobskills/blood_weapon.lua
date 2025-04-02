-----------------------------------
-- Blood Weapon
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLOOD_WEAPON, 1, 0, 30)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.BLOOD_WEAPON
end

return mobskillObject
