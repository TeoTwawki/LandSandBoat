-----------------------------------
--  Aegis Schism
--
--  Description: Damage varies with TP. Additional effect: defense down
--  Type: Physical (Blunt)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

-- TODO: this doesnt do damage according to jimmy's sheet
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits  = 1
    local accmod   = 1
    local ftp      = 2
    local info     = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg      = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)
    local power    = 75
    local duration = 120

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, power, 0, duration)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)

    return dmg
end

return mobskillObject
