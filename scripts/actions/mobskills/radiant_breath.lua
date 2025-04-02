-----------------------------------
--  Radiant Breath
--  Description: Deals light damage to enemies within a fan-shaped area of effect originating from the caster. Additional effect: Slow and Silence.
--  Type: Magical (Light)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 120)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 0.75, invaderXim.element.LIGHT, 700)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT)
    return dmg
end

return mobskillObject
