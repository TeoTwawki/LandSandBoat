-----------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 1.5
    local info    = invaderXim.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, invaderXim.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, info.hitslanded)

    if
        skill:getMsg() ~= invaderXim.msg.basic.SHADOW_ABSORB and
        skill:getMsg() ~= invaderXim.msg.basic.ANTICIPATE
    then
        if dmg > 0 then
            skill:setMsg(invaderXim.msg.basic.RANGED_ATTACK_HIT)
            target:addTP(20)
            mob:addTP(80)
        else
            skill:setMsg(invaderXim.msg.basic.RANGED_ATTACK_MISS)
        end

        target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)
    end

    return dmg
end

return mobskillObject
