-----------------------------------
--  Amatsu: Tsukikage
--  Type: Physical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getObjType() == invaderXim.objType.TRUST then
        return 0
    else
        return 1 --if BCNM version dont use this
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod  = 2
    local ftp     = 3.5 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    return dmg
end

return mobskillObject
