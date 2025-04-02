-----------------------------------
--  Cannonball
--  Family: Wamouracampa
--  Description: Damage varies with TP.
--  Type: Physical
--  Utsusemi/Blink absorb: One shadow
--  Range: 20
--  Notes: Uses defense instead of attack. Curled form only.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 5 then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits      = 1
    local accmod       = 1
    local ftp          = 1.5
    local isCannonball = true
    local info         = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0, isCannonball)
    local dmg          = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)

    return dmg
end

return mobskillObject
