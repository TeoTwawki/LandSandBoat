-----------------------------------
--  Amatsu: Hanaikusa
--  Type: Physical
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if
        mob:getObjType() == invaderXim.objType.TRUST or
        mob:getAnimationSub() == 0
    then
        return 0
    else
        return 1
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power    = 22.5
    local duration = 60
    local numhits  = 1
    local accmod   = 2
    local ftp      = 6 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info     = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg      = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    if info.hitslanded > 0 then
        target:addStatusEffect(invaderXim.effect.PARALYSIS, power, 0, duration)
    end

    return dmg
end

return mobskillObject
