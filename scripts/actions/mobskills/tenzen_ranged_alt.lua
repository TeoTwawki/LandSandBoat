-----------------------------------
-- Tenzed Ranged Attack Alt
-- Only Used when in Bow Mode
-- Deals a ranged attack to a single target.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5

    local info = invaderXim.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING, info.hitslanded)
    local msg = skill:getMsg()
    if
        dmg > 0 and
        msg ~= invaderXim.msg.basic.SHADOW_ABSORB
    then
        target:addTP(20)
        mob:addTP(80)
    end

    if msg ~= invaderXim.msg.basic.SHADOW_ABSORB then
        target:takeDamage(dmg, mob, invaderXim.attackType.RANGED, invaderXim.damageType.PIERCING)
    end

    skill:setMsg(352) -- fixes incorrect messages on ranged attacks
    return dmg
end

return mobskillObject
