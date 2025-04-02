-----------------------------------
--  Thunderstrike
--
--  Description: Deals Lightning damage in an area of effect. Additional effect: Stun
--  Type: Magical
--  Ignores Shadows
--  Range: 13' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:getFamily() == 316 and
        mob:getModelId() ~= 1805
    then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.THUNDER, 3, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.THUNDER)

    return damage
end

return mobskillObject
