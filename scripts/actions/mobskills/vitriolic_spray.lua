-----------------------------------
--  Vitriolic Spray
--  Family: Wamouracampa
--  Description: Expels a caustic stream at targets in a fan-shaped area of effect. Additional effect: Burn
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadow
--  Range: Cone
--  Notes: Burn is 10-30/tic
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.7)
    damage = damage + math.random(0, 4.5 + math.max(mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT), 0))

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BURN, math.random(10, 30), 3, 60)

    return damage
end

return mobskillObject
