-----------------------------------
-- Hysteroanima
-- Used by Trust: Prishe II
-- Grants a temporary magic shield
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.MAGIC_SHIELD, 1, 0, 10)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.MAGIC_SHIELD
end

return mobskillObject
