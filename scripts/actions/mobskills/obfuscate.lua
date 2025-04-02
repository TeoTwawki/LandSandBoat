-----------------------------------
-- Obfuscate
-- Description: A blinding wave hits players in an area of effect.
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
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 20, 0, 120))

    return invaderXim.effect.BLINDNESS
end

return mobskillObject
