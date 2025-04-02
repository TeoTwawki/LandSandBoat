-----------------------------------
-- Difusion Ray
-- Description: Deals damage to enemies within a fan-shaped area originating from the caster.
-- Type: Magical Light (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 0.65, invaderXim.element.LIGHT, 500)
    local dmg    = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT)

    return dmg
end

return mobskillObject
