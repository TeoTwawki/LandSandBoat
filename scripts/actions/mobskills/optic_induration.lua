-----------------------------------
--  Optic Induration
--
--  Description: Charges up a powerful, calcifying beam directed at targets in a fan-shaped area of effect. Additional effect: Petrification & enmity reset
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Charges up (three times) before actually being used (except Jailer of Temperance, who doesn't need to charge it up). The petrification lasts a very long time.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        not mob:isNM() or
        mob:getAnimationSub() == 2 or
        mob:getAnimationSub() == 3
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, 60)
    mob:resetEnmity(target)

    return damage
end

return mobskillObject
