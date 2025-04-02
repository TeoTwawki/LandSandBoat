-----------------------------------
--  Mind Blast
--  Description: Deals lightning damage to an enemy. Additional effect: "Paralysis"
--  Type: Magical (lightning)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 6

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 20, 0, 180)

    return damage
end

return mobskillObject
