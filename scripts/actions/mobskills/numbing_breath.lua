-----------------------------------
--  Numbing Breath
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralyze.
--  Type: Magical Ice (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 20, 0, 60)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 1.875, invaderXim.element.ICE, 500)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.ICE)
    return dmg
end

return mobskillObject
