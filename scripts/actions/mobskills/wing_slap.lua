-----------------------------------
--  Wing Slap
--  Description: Slaps around a single target four times with its wings. Additional effect: Stun
--  Type: Physical
--  Utsusemi/Blink absorb: 4 shadows
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return invaderXim.apkallu.canUseAbility(mob, 20)
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local ftp    = 0.25
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.STUN, 1, 0, 4)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
