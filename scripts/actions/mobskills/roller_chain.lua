-----------------------------------
-- Roller Chain
-- Only used by Ramparts when its door is closed
-- Description: Single target Bind, Silence, Amnesia.
-- Type: Magical
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 10' Aoe
-----------------------------------

---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 0 then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 2

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.DMG_VARIES)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.AMNESIA, 3000, 0, 30)

    return damage
end

return mobskillObject
