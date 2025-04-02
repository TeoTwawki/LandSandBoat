-----------------------------------
-- Slumber Powder
-- 10' AoE sleep
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = math.random(15, 20) + mob:getMainLvl() / 4

    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, power))

    return invaderXim.effect.SLEEP_I
end

return mobskillObject
