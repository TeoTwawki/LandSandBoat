-----------------------------------
--  Aqua Blast
--
--  Description: Fires a blast of Water, dealing damage in a fan-shaped area. Additional effect: knockback
--  Type: Magical (Water)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Fan (cone)
--  Note: There was not a lot of information about this spell available online, so
--        the initial implementation is relatively basic.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- Do not use this weapon skill on targets behind.
    -- Sub-Zero Smash should trigger in this case.
    if target:isBehind(mob) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WATER, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WATER)

    return damage
end

return mobskillObject
