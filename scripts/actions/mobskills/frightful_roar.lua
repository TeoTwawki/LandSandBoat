-----------------------------------
-- Frightful Roar
--
-- Description: Weakens defense of enemies within range.
-- Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 10, 0, 180))

    return invaderXim.effect.DEFENSE_DOWN
end

return mobskillObject
