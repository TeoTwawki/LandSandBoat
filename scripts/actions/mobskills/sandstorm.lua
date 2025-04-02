-----------------------------------
-- Sandstorm
-- Kicks up a blinding dust cloud on targets in an area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 15, 0, 120))

    return invaderXim.effect.BLINDNESS
end

return mobskillObject
