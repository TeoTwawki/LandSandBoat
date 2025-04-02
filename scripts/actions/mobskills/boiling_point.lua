-----------------------------------
-- Boiling Point
--
-- Description: Reduces magic defense in a fan-shaped area of effect.
-- Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MAGIC_DEF_DOWN, 50, 0, 120))

    return invaderXim.effect.MAGIC_DEF_DOWN
end

return mobskillObject
