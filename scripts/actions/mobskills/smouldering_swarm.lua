-----------------------------------
--  Smouldering Swarm
--
--  Description: Deals Fire damage to enemies within an area of effect. Additional effect: Knockback
--  Type: Magical (Fire)
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 10' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 2
    local duration = math.random(15, 90)
    local damage = mob:getWeaponDmg()

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, dmgmod, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)
    target:addStatusEffect(invaderXim.effect.BURN, 10, 3, duration)
    return damage
end

return mobskillObject
