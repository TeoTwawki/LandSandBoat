-----------------------------------
-- Intimidate
-- Inflicts slow on targets in a fan-shaped area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120))

    return invaderXim.effect.SLOW
end

return mobskillObject
