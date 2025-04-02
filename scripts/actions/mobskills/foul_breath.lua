-----------------------------------
--  Foul Breath
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- not used in Uleguerand_Range
    if mob:getZoneID() == 5 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DISEASE, 1, 0, 300)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.333, 0.625, invaderXim.element.FIRE, 500)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE)
    return dmg
end

return mobskillObject
