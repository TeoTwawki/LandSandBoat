-----------------------------------
--  Glacier Splitter
--
--  Description: Cleaves into targets in a fan-shaped area. Additional effect: Paralyze
--  Type: Physical
--  Utsusemi/Blink absorb: 1-3 shadows
--  Range: Unknown cone
--  Notes: Only used the Aern wielding a sword (RDM, DRK, and PLD).
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(1, 3)
    local accmod = 1
    local ftp    = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.PARALYSIS, 15, 0, 120)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
