-----------------------------------
-- Awful Eye
-- 15' Reduces STR of players in area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.STR_DOWN, 33, 3, 120))

    return invaderXim.effect.STR_DOWN
end

return mobskillObject
