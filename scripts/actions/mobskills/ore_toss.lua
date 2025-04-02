-----------------------------------
--  Ore Toss
--
--  Description: Deals high damage in a ranged attack.
--  Type: Ranged
--  Utsusemi/Blink absorb: Yes
--  Range: Unknown range
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

-- TODO: damage scales depending on distance
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local ftp     = 2
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.BLUNT, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.BLUNT)

    return dmg
end

return mobskillObject
