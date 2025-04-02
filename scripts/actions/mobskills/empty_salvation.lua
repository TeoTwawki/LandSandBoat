-----------------------------------
-- Empty Salvation
-- Damages all targets in range with the salvation of emptiness. Additional effect: Dispels 3 effects
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)

    -- Dispel 3 status effects
    target:dispelStatusEffect(invaderXim.effectFlag.DISPELABLE)
    target:dispelStatusEffect(invaderXim.effectFlag.DISPELABLE)
    target:dispelStatusEffect(invaderXim.effectFlag.DISPELABLE)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)

    return damage
end

return mobskillObject
