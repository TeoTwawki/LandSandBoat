-----------------------------------
-- Mega Holy
--
-- Description:     Deals Light damage to targets in an area of effect.
-- Type: Magical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: Unknown radial "Extremely large damage radius." says wiki.
-- Notes: Accompanied by text
-- "Open thine eyes...
-- My radiance...shall guide thee..."
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.LIGHT, 3, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)

    return damage
end

return mobskillObject
