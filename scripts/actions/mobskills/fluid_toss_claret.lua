-----------------------------------
--  Fluid Toss (Claret)
--  Description: Lobs a ball of liquid at a single target.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: 15
--  Applies 100hp/tick poison if it hits.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

-- TODO: can crit
-- TODO: is claret different on ftp?
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 4.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    -- Apply poison if it hits
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.POISON, 100, 3, math.random(3, 6) * 3)  -- 3-6 ticks

    return dmg
end

return mobskillObject
