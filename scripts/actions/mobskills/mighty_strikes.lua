-----------------------------------
-- Mighty Strikes
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MIGHTY_STRIKES, 1, 0, 45)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.MIGHTY_STRIKES
end

return mobskillObject
