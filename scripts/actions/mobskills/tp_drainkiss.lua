-----------------------------------
-- Drainkiss
-- Deals dark damage to a single target. Additional effect: TP Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local damage = math.floor(mob:getWeaponDmg() * 2.6)

    damage = invaderXim.mobskills.mobMagicalMove(mob, target, skill, damage, invaderXim.element.DARK, 1, invaderXim.mobskills.magicalTpBonus.MAB_BONUS, 1)
    damage = invaderXim.mobskills.mobFinalAdjustments(damage, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.DARK, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.TP, damage))

    return damage
end

return mobskillObject
