-----------------------------------
-- Perfect Dodge
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PERFECT_DODGE, 1, 0, 30)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.PERFECT_DODGE
end

return mobskillObject
