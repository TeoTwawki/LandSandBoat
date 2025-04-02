-----------------------------------
-- Vulcan Shot
--
-- Description: Fires an explosive bullet at targets in an area of effect.
-- Type: Magical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: Wipes shadows?
-- Range: 14' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    mob:messageBasic(invaderXim.msg.basic.READIES_WS, 0, 254)

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 8, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)

    return damage
end

return mobskillObject
