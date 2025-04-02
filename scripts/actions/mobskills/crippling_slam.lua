-----------------------------------
--  Crippling Slam
--  Description: Deals severe damage to targets in front of it by slamming into them. Additional effect: Paralysis.
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes Shadows
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isInfront(mob) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 4
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    local duration = invaderXim.mobskills.calculateDuration(skill:getTP(), 30, 60)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 50, 0, duration))

    return dmg
end

return mobskillObject
