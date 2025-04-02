-----------------------------------
-- Deathgnash
-- Description: Chomps on a single target, reducing HP to one and resets enmity.
-- Type: Physical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = target:getHP() - 1
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(damage, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    mob:resetEnmity(target)

    return damage
end

return mobskillObject
