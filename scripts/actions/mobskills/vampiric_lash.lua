-----------------------------------
-- Vampiric Lash
-- Description: Deals 200% physical damage to a single target. Additional effect: Drain
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: In ToAU zones, this has an additional effect of absorbing all status effects, including food.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 2
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local damage  = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    target:takeDamage(damage, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)

    skill:setMsg(invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, damage))

    return damage
end

return mobskillObject
