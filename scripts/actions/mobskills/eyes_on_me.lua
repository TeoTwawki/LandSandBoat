-----------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = mob:getWeaponDmg() * 4

    local dmg = invaderXim.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, invaderXim.attackType.SPECIAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.SPECIAL, invaderXim.damageType.DARK)

    return dmg
end

return mobskillObject
