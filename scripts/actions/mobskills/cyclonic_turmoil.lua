-----------------------------------
-- Cyclonic Turmoil
--
-- Deals Wind damage in an area of effect. Additional effect: Knockback & Dispel
-- Notes: Dispels multiple buffs. Wipes shadows.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2.8

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    local dispel1 = target:dispelStatusEffect()
    local dispel2 = target:dispelStatusEffect()
    local total   = 0

    if dispel1 ~= invaderXim.effect.NONE then
        total = total + 1
    end

    if dispel2 ~= invaderXim.effect.NONE then
        total = total + 1
    end

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)

    if total == 0 then
        return damage
    else
        skill:setMsg(invaderXim.msg.basic.DISAPPEAR_NUM)

        return total
    end
end

return mobskillObject
