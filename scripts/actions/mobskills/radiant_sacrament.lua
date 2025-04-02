-----------------------------------
-- Radiant Sacrament
-- Description: Used at regular intervals as a ranged attack when target is out of melee range.
-- Type: Physical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 20' maximum distance, unknown smaller radial (around target)
-- Notes: Alexander generally uses this on targets out of his melee range. Accompanied by text
-- "Offer thy worship...
-- I shall burn away...thy transgressions..."
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 5
    local ftp    = 2 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.MAGIC_DEF_DOWN, 20, 0, 60) -- Needs adjusted to retail values for power/duration

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
