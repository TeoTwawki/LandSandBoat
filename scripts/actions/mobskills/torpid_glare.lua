-----------------------------------
-- Torpid Glare
-- Description: Sleeps opponents with a gaze attack.
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-- Notes: Nightmare Cockatrice extends this to a fan-shaped AOE.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 30))

    return invaderXim.effect.SLEEP_I
end

return mobskillObject
