-----------------------------------
-- Aeolian Void
--
-- Description: Fan AoE damage plus Silence and Blind
-- Type: Earth Damage/Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 15, 0, 60)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.25, 2.5, invaderXim.element.EARTH, 300)
    local dmg    = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH)

    return dmg
end

return mobskillObject
