-----------------------------------
--  Hurricane Wing
--
--  Description: Deals hurricane-force wind damage to enemies within a very wide area of effect. Additional effect: Blind
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial.
--  Notes: Used only by Dragua, Fafnir, Nidhogg, Cynoprosopi, Wyrm, and Odzmanouk. The blinding effect does not last long
--                but is very harsh. The attack is wide enough to generally hit an entire alliance.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isInfront(mob, 128) then
        return 1
    elseif mob:getAnimationSub() == 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, mob:getMainLvl() + 2, invaderXim.element.WIND, 4, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND)

    if mob:getPool() == 2840 then -- Nidhogg
        invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 160, 0, 30)
    else
        invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BLINDNESS, 100, 0, 30)
    end

    return damage
end

return mobskillObject
