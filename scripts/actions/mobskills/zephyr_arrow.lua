-----------------------------------
--  Zephyr Arrow
--  Description: Deals a ranged attack to target. Additional effect: Knockback and Bind
--  Type: Ranged
--  Utsusemi/Blink absorb: Ignores Utsusemi
--  Range: Unknown
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 4
    local ftp    = 5 -- fTP and fTP scaling unknown. TODO: capture ftp

    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, { breakBind = false })

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 120)

    return dmg
end

return mobskillObject
