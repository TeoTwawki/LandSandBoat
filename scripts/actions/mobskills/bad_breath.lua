-----------------------------------
--  Bad Breath
--
--  Description: Deals earth damage that inflicts multiple status ailments on enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Earth)
--
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, mob:getMainLvl() / 10, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 15, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 15, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 60)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.15, 3, invaderXim.element.EARTH, 500)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, { breakBind = false })

    return dmg
end

return mobskillObject
