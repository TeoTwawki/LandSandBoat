-----------------------------------
-- Antigravity w/ 1 Gear
-- Knockback and damage, knockback varies with gear count
-----------------------------------
-- TODO: The potency of the knockback effect varies with
-- the number of gears in the enemy formation. A single gear produces only a
-- slight knockback, whereas triple gears produce a very strong knockback.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local ftp     = 2
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:delHP(dmg)

    return dmg
end

return mobskillObject
