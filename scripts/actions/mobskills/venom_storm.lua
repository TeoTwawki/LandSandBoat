-----------------------------------
-- Venom Storm
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, math.random(20, 30), 3, 60))

    return invaderXim.effect.POISON
end

return mobskillObject
