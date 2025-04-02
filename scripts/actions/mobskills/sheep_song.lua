-----------------------------------
-- Sheep Song
-- 15' AoE sleep
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 20))

    return invaderXim.effect.SLEEP_I
end

return mobskillObject
