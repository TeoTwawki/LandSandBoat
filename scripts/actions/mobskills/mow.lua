-----------------------------------
--  Mow
--
--  Description: Deals damage in an area of effect. Additional effect: Poison
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Poison can take around 10HP/tick
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local ftp    = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)
    local power = mob:getMainLvl() / 4 + 3

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.POISON, power, 3, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
