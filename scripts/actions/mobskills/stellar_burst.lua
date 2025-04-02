-----------------------------------
-- Stellar Burst
-- A starburst damages targets in an area of effect. Additional effect: Silence
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg()

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.NONE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 30)

    if not target:isTrust() then
        mob:resetEnmity(target)
    end

    return damage
end

return mobskillObject
