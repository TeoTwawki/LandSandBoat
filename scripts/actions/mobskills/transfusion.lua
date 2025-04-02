-----------------------------------
--  Transfusion
--  Description: Steals HP from players within range.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = mob:getWeaponDmg() * 3

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    skill:setMsg(invaderXim.mobskills.mobDrainMove(mob, target, invaderXim.mobskills.drainType.HP, damage, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK))

    return damage
end

return mobskillObject
