-----------------------------------
--  Hiemal Storm
--
--  Description: Extreme directional AoE ice damage for 200-1400 points
--  Type: Breath
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Used only by Snoll Tzar
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 1.25, invaderXim.element.ICE, 1400)
    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.9)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.ICE)
    return dmg
end

return mobskillObject
