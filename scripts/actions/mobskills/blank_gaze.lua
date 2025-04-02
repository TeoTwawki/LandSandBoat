-----------------------------------
-- Blank Gaze
-- Powerful Paralyze Gaze Attack.
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee?
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.PARALYSIS, 35, 0, 60))

    return invaderXim.effect.PARALYSIS
end

return mobskillObject
