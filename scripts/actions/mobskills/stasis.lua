-----------------------------------
-- Stasis
-- Description: Paralyzes targets in an area of effect.
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
    local shadows = invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1
    -- local dmg = invaderXim.mobskills.mobFinalAdjustments(10, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, shadows)

    mob:resetEnmity(target)

    if invaderXim.mobskills.mobPhysicalHit(skill) then
        skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 40, 0, 60))

        return invaderXim.effect.PARALYSIS
    end

    return shadows
end

return mobskillObject
