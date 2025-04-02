-----------------------------------
--  Shield Strike
--
--  Description: Attempts to Shield Bash players.  Additional effect: Stun
--  Type: Physical
--  1 shadow?
--  Range: Melee front arc
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- TODO: Knockback

    local numhits = 1
    local accmod = 1
    local ftp    = 0.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_1)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 0, 4)

    -- <100 damage to pretty much anything, except on rare occasions.
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
