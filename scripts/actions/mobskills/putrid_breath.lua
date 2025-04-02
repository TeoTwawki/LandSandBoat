-----------------------------------
-- Putrid Breath
-- Description: Deals breath damage to enemies around the target..
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores Shadows
-- Notes: Only used by Cirrate Christelle
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 8

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.BREATH, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.BREATH, invaderXim.damageType.DARK)

    return damage
end

return mobskillObject
