-----------------------------------
-- Ice Roar
-- Emits the roar of an impact event, dealing damage in a fan-shaped area of effect. Ice damage
-- Ignores Shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getZoneID() == 135 or mob:getZoneID() == 111 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 4

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.ICE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ICE)

    return damage
end

return mobskillObject
