-----------------------------------
--  Miasma
--
--  Description: Releases a toxic cloud on nearby targets. Additional effects: Slow + Poison + Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.EARTH, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.EARTH)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 5, 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, math.floor(mob:getMainLvl() / 3), 3, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 3, 120)

    return damage
end

return mobskillObject
