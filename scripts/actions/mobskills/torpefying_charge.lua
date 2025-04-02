-----------------------------------
--  Torpefying Charge
--
--  Description: Gaze paralysis for 2 minutes.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.PARALYSIS, 15, 0, 120))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
