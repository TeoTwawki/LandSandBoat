-----------------------------------
-- Sound Blast
-- 15' Reduces INT of players in area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.INT_DOWN, 10, 3, 120))

    return invaderXim.effect.INT_DOWN
end

return mobskillObject
