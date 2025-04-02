-----------------------------------
-- Cold Stare
-- Silences enemies in a line area of effect.
-- Notes: Only applies when face-to-face with the dhalmel.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60))

    return invaderXim.effect.SILENCE
end

return mobskillObject
