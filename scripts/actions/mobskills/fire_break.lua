-----------------------------------
-- Fire Break
-- Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
-- Type: Magical (Fire)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.5, 1, invaderXim.element.FIRE, 700)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE)
    return dmg
end

return mobskillObject
