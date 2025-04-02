-----------------------------------
-- Poison Sting
-- Induces poison
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 5, 3, 180))

    return invaderXim.effect.POISON
end

return mobskillObject
