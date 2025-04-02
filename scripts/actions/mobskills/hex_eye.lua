-----------------------------------
-- Hex Eye
-- Description: Paralyzes with a gaze.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Line of sight
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.PARALYSIS, 25, 0, 120))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
