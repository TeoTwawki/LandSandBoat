-----------------------------------
--  Cosmic Elucidation
--  Description: Cosmic Elucidation inflicts heavy AOE damage to everyone in the battle.
--  Type:
--  Utsusemi/Blink absorb: Ignores shadows
--  Range:
--  Notes: Ejects all combatants from the battlefield, resulting in a failure.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 1 -- only scripted use
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 21

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.LIGHT, 2, invaderXim.mobskills.magicalTpBonus.DMG_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT, 0)
    damage = math.min(0, damage) -- Cosmic Elucidation does not have an absorb message

    target:takeDamage(damage, mob, invaderXim.attackType.SPECIAL, invaderXim.damageType.ELEMENTAL)
    skill:setMsg(302)

    return damage
end

return mobskillObject
