-----------------------------------
-- Hundred Fists
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- note that captures show that mobskill hundred fists is still 45 seconds on retail
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.HUNDRED_FISTS, 1, 0, 45)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.HUNDRED_FISTS
end

return mobskillObject
