-----------------------------------
-- Raiden Thrust
--
-- Deals lightning elemental damage. Damage varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 1.25, invaderXim.mobskills.magicalTpBonus.DMG_BONUS, 2)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)

    return damage
end

return mobskillObject
