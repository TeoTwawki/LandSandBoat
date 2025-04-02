-----------------------------------
--  Thunder Breath
--  Description: Deals thunder damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Thunder)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isInDynamis() or target:hasStatusEffect(invaderXim.effect.BATTLEFIELD)  then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.5, 1, invaderXim.element.THUNDER, 700)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.THUNDER)
    return dmg
end

return mobskillObject
