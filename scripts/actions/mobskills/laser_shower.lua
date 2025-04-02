-----------------------------------
-- Laser_Shower
-- Description: Fires several lasers into a fan-shaped area of effect. Additional effect: Defense Down
-- Type: Breath
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isBehind(mob, 48) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 1.25, invaderXim.element.LIGHT, 1600)
    local dis = ((mob:checkDistance(target) * 2) / 20)

    dmgmod = dmgmod * dis
    dmgmod = utils.clamp(dmgmod, 50, 1600)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, 25, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.LIGHT)
    return dmg
end

return mobskillObject
