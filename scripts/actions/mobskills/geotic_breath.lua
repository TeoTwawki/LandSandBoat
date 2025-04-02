-----------------------------------
--  Geotic Breath
--
--  Description: Deals Earth damage to enemies within a fan-shaped area.
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Used only by Ouryu
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:hasStatusEffect(invaderXim.effect.INVINCIBLE) then
        return 1
    elseif not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() ~= 0 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 1.25, invaderXim.element.EARTH, 1400)
    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.9)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.EARTH)
    return dmg
end

return mobskillObject
