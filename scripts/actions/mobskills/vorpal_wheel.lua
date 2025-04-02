-----------------------------------
--  Vorpal Wheel
--
--  Description: Throws a slicing wheel at a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Unknown
--  Notes: Only used by Gulool Ja Ja, and will use it as a counterattack to any spells cast on him. Damage increases as his health drops. Can be Shield Blocked.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    -- Increase damage as health drops
    local ftp    = (1 - (mob:getHP() / mob:getMaxHP())) * 6
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
