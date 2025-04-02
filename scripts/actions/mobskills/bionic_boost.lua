-----------------------------------
-- Bionic Boost
-- Description:
-- Gives the user the effect of counterstance
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = invaderXim.effect.COUNTERSTANCE

    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, typeEffect, 1, 0, 60))
    return typeEffect
end

return mobskillObject
