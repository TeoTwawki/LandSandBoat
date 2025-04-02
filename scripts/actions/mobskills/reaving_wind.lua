-----------------------------------
--  Reaving Wind
--    Mob Ability: 2431
--  Description: Deals damage in an area of effect. Reduces target's TP by 1000.
--  Type: Magical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Causes Amphipteres to enter into an aura state
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.NONE, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    if target:getTP() == 0 then
        skill:setMsg(invaderXim.msg.basic.SKILL_NO_EFFECT)
    else
        target:setTP(target:getTP() - 1000)
    end

    target:takeDamage(damage, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.NONE)

    return damage
end

return mobskillObject
