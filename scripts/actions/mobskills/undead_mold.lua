-----------------------------------
--  Undead Mold
--  Description: Releases undead spores that diseases targets in front.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Front arc
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.5)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.DISEASE, 1, 0, 180)

    return damage
end

return mobskillObject
