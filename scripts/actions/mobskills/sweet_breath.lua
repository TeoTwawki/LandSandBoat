-----------------------------------
-- Sweet Breath
-- Description: Deals water damage to enemies within a fan-shaped area originating from the caster.
-- Type: Magical Water (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.125, 3, invaderXim.element.WATER, 500)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WATER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLEEP_I, 1, 0, 30)

    return dmg
end

return mobskillObject
