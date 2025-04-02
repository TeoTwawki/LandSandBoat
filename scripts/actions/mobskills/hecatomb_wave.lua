-----------------------------------
--  Hecatomb Wave
--  Description: Deals wind damage to enemies within a fan-shaped area originating from the caster. Additional effect: Blindness.
--  Type: Magical (Wind)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 15, 0, 180)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.1, 1.5, invaderXim.element.WIND, 400)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WIND)
    return dmg
end

return mobskillObject
