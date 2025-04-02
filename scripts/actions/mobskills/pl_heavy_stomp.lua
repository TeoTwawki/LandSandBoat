-----------------------------------
-- Heavy Stomp
--
-- Description: Deals heavy damage to targets within an area of effect. Additional effect: Paralysis
-- Type: Physical
-- Utsusemi/Blink absorb: 2-3 shadows
-- Range: Unknown radial
-- Notes: Paralysis effect has a very long duration.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    local mobSkin = mob:getModelId()

    if mobSkin == 421 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local ftp    = .7
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.PARALYSIS, 15, 0, 360)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)

    return dmg
end

return mobskillObject
