-----------------------------------
-- Invincible
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.INVINCIBLE, 1, 0, 30)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.INVINCIBLE
end

return mobskillObject
