-----------------------------------
-- Slipstream
-- Reduces accuracy of targets in area of effect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.ACCURACY_DOWN, 25, 0, math.random(120, 180)))

    return invaderXim.effect.ACCURACY_DOWN
end

return mobskillObject
