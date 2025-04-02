-----------------------------------
-- Gnash
-- Description: Chews on a single target, reducing HP to one half.
-- Type: Physical
-- Notes: Retail testing shows this is more like 45% to 55% of the targets current HP
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(target:getHP() * (math.random(45, 55) / 100))
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(damage, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    mob:resetEnmity(target)

    return damage
end

return mobskillObject
