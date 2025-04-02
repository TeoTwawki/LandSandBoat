-----------------------------------
--  Leafstorm
--  Description: Deals wind damage within area of effect.
--  Type: Magical Wind
-- Notes: When used by Cernunnos, Cemetery Cherry, and leafless Jidra: Leafstorm dispels all positive status effects (including food) and gives a Slow effect equivalent to Slow I.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if
        mob:getName() == 'Cernunnos' or
        mob:getPool() == 671 or
        mob:getPool() == 1346
    then
        invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 128, 3, 120)

        local count = target:dispelAllStatusEffect(bit.bor(invaderXim.effectFlag.DISPELABLE, invaderXim.effectFlag.FOOD))
        if count == 0 then
            skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
        else
            skill:setMsg(invaderXim.msg.basic.DISAPPEAR_NUM)
        end

        return count
    else
        local damage = mob:getWeaponDmg() * math.random(4, 5)

        damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
        damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

        target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)

        return damage
    end
end

return mobskillObject
