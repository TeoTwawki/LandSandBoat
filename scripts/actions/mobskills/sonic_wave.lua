-----------------------------------
-- Sonic Wave
-- Reduces defense of enemies in an area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DEFENSE_DOWN, 30, 0, 120))

    return invaderXim.effect.DEFENSE_DOWN
end

return mobskillObject
