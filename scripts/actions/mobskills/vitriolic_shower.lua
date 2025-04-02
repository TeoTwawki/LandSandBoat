-----------------------------------
--  Vitriolic Shower
--  Description: Expels a caustic stream at targets in a fan-shaped area of effect. Additional effect: Burn
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadow
--  Range: Cone
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.7)
    damage = damage + math.random(0, 7.5 + math.max(mob:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT) * 4 / 3, 0))

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 2, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BURN, math.random(15, 35), 3, 60)

    return damage
end

return mobskillObject
