-----------------------------------
--  Great Whirlwind
--  Description: Deals Wind damage to targets in front. Additional effect: Choke
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4
    local power  = math.floor(mob:getMainLvl() * 0.15) + 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.CHOKE, power, 3, 60)

    return damage
end

return mobskillObject
