-----------------------------------
--  Silence Gas
--  Description: Emits a noxious cloud in a fan-shaped area of effect, dealing Wind damage to all targets. Additional effect: silence
--  Type: Magical Wind (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.25, 2, invaderXim.element.WIND, 800)
    local dmg    = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.WIND)
    return dmg
end

return mobskillObject
