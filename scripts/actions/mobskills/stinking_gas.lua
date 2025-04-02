-----------------------------------
-- Stinking Gas
-- Description: Lowers Vitality of enemies within range.
-- Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.VIT_DOWN, 10, 3, 120))

    return invaderXim.effect.VIT_DOWN
end

return mobskillObject
