-----------------------------------
-- Sulfurous_Breath
-- Deals Fire damage to enemies within a fan-shaped area.
-- Breath Attack
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isBehind(mob, 48) then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = invaderXim.mobskills.mobBreathMove(mob, target, skill, 0.2, 0.75, invaderXim.element.FIRE, 700)

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.BREATH, invaderXim.damageType.FIRE)
    return dmg
end

return mobskillObject
