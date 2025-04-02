-----------------------------------
--  Pleiades Ray
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobhp = mob:getHPP()

    if mobhp <= 20 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 7

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.FIRE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.FIRE, { breakBind = false })
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 40, 3, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 40, 3, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 10, 3, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PLAGUE, 5, 3, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 120)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 120)

    return damage
end

return mobskillObject
