-----------------------------------
-- Ichor Stream
-- Family: Hpemde
-- Description: Spews venomous ichor at targets in a fan-shaped area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Cone
-- Notes: Poison is about 5/tic.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 5, 0, 120))

    return invaderXim.effect.POISON
end

return mobskillObject
