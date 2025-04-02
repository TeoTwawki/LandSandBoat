-----------------------------------
--  Frenetic Rip
--  Description: Delivers a threefold attack. Damage varies with TP.
--  Type: Physical (Blunt)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 4 and mob:getFamily() == 165 then -- Imps - with horn
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local ftp    = 1
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
