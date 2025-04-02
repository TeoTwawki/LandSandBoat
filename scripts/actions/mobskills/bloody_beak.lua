-----------------------------------
--  Bloody Beak
--    Mob Ability: 2428
--  Description: Steals HP from targets within a fan-shaped area.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: 5'
--  Notes: Seems to be magical-based Drain.
--    Witnessed Paladin taking lower damage from it than Ninja with Shell only.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.WIND, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.WIND, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, damage))

    return damage
end

return mobskillObject
