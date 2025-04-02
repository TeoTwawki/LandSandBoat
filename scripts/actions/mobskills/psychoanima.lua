-----------------------------------
-- Psychoanima
-- Used by Trust: Prishe II
-- Grants a temporary physical shield
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.PHYSICAL_SHIELD, 1, 0, 10)

    skill:setMsg(invaderXim.msg.basic.USES)

    return invaderXim.effect.PHYSICAL_SHIELD
end

return mobskillObject
