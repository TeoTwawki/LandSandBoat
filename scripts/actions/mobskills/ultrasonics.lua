-----------------------------------
-- Ultrasonics
-- Reduces evasion of targets in area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.EVASION_DOWN, 25, 0, 180))

    return invaderXim.effect.EVASION_DOWN
end

return mobskillObject
