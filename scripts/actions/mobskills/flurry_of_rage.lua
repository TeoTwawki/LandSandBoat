-----------------------------------
-- Flurry of Rage
-- Deals multiple hits to a single target.
-- Only used by Eldritch Edge, Malefic Fencer, and Nightmare Weapon.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 2
    local accmod = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, 1, invaderXim.mobskills.physicalTpBonus.ACC_VARIES, 2, 2.5, 3)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    return dmg
end

return mobskillObject
