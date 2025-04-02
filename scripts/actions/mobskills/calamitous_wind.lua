-----------------------------------
--  Calamitous Wind
--    Mob Ability: 2433
--  Description: Destructive winds deal Wind damage to players in range.
--    Additional effect: knockback + full dispel
--  Type: Magical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 20' radial
--  Notes: Only used by Zirnitra, Turul, and Amhuluk under 50%
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getHPP() >= 50 then
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    -- TODO: Should print *each* effect dispelled in addition to damage taken.
    target:dispelAllStatusEffect(bit.bor(invaderXim.effectFlag.DISPELABLE, invaderXim.effectFlag.FOOD))
    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)

    return damage
end

return mobskillObject
