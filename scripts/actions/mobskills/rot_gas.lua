-----------------------------------
-- Rot Gas
--
-- Description: Inflicts enemies in an area of effect with a disease.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DISEASE, 1, 0, 180))

    return invaderXim.effect.DISEASE
end

return mobskillObject
