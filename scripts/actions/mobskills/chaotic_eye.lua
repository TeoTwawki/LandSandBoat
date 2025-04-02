-----------------------------------
-- Chaotic Eye
--
-- Description: Silences an enemy.
-- Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 120))

    return invaderXim.effect.SILENCE
end

return mobskillObject
