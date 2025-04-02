-----------------------------------
--  Cold Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Bind.
--  Type: Magical Ice (Element)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 20)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 0.75, invaderXim.element.ICE, 600)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, { breakBind = false })
    return dmg
end

return mobskillObject
