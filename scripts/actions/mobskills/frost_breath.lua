-----------------------------------
--  Frost Breath
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster. Additional effect: Paralysis.
--  Type: Magical (Ice)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- only used in Uleguerand_Range
    if mob:getZoneID() == 5 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 25, 0, 120)

    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.333, 0.625, invaderXim.element.ICE, 500)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.ICE)
    return dmg
end

return mobskillObject
