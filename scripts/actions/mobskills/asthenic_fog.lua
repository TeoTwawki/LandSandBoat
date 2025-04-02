-----------------------------------
-- Asthenic Fog
--
-- Description: A mist drowns all nearby targets.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DROWN, 25, 3, 120))

    return invaderXim.effect.DROWN
end

return mobskillObject
