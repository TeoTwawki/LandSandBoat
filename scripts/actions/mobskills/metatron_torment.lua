-----------------------------------
--  Metatron Torment
--
--  Description: Lowers target's defense. Bravura/Abaddon Killer: Temporarily lowers damage taken from enemies.
--  Type: Physical
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.5 -- fTP and fTP scaling unknown. TODO: capture ftp

    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    local duration = 60
    local power = 19

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, power, 0, duration)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
