-----------------------------------
--  Pile Pitch
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  , Bind (30 sec)
--  Type: Magical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local currentHP = target:getHP()
    local damage = currentHP * .90
    local dmg = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30)
    target:takeDamage(dmg, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE, { breakBind = false })
    mob:resetEnmity(target)
    return dmg
end

return mobskillObject
