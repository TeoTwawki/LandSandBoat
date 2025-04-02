-----------------------------------
-- Drain Whip
-- Description: Drains HP, MP, or TP from the target.
-- Type: Magical
-- Utsusemi/Blink absorb: ignores shadows
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage     = mob:getWeaponDmg() * 3
    local drainTable = { invaderXim.mobskills.drainType.HP, invaderXim.mobskills.drainType.MP, invaderXim.mobskills.drainType.TP }

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, drainTable[math.random(1, 3)], damage))

    return damage
end

return mobskillObject
