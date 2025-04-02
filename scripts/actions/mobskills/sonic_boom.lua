-----------------------------------
-- Sonic Boom
-- Reduces attack of targets in area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.ATTACK_DOWN, 50, 0, 120))

    return invaderXim.effect.ATTACK_DOWN
end

return mobskillObject
