-----------------------------------
--  Impalement
--  Description: Deals damage to a single target reducing their HP to 5%. Resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 128, 0, 120)
    local currentHP = target:getHP()
    -- remove all by 5%
    local stab = currentHP * .95

    local dmg = invaderXim.mobskills.mobFinalAdjustments(stab, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    mob:resetEnmity(target)
    return dmg
end

return mobskillObject
