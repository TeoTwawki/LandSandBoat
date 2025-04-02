-----------------------------------
--  Hyper_Pulse
--
--  Description:  300 magic damage, Gravity and short Bind, wipes Utsusemi
--  Type: Physical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isBehind(mob) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1.5, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, { breakBind = false })
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 4)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 30)

    return damage
end

return mobskillObject
