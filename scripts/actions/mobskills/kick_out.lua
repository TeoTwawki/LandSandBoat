-----------------------------------
-- Kick Out
--
-- Description: Deals heavy damage and inflicts blind to any target behind user.
-- Type: Physical
-- Utsusemi/Blink absorb: 2-3 shadows
-- Range: Unknown cone, backwards
-- Notes:  Only used when the Behemoth is attacking with its tail.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if not target:isBehind(mob, 48) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local ftp    = 3
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.HTH, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.BLINDNESS, 20, 0, 120)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.HTH)
    return dmg
end

return mobskillObject
