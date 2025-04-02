-----------------------------------
-- Yawn
-- 15' AoE sleep
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local duration = math.random(60, 120)
    skill:setMsg(invaderXim.mobskills.mobGazeMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, duration))

    return invaderXim.effect.SLEEP_I
end

return mobskillObject
