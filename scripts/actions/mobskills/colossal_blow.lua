-----------------------------------
-- Colossal_Blow
-- Deals damage to a single target.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local currentHP = target:getHP()
    local damage    = currentHP

    -- if we have more than 30% hp, reduce to 5%
    if target:getHPP() > 30 then
        damage = currentHP * .95
    end

    local dmg = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    mob:resetEnmity(target)
    return dmg
end

return mobskillObject
