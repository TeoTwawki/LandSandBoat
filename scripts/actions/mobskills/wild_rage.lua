-----------------------------------
--  Wild Rage
--
--  Description: Deals physical damage to enemies within area of effect.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: 15' radial
--  Notes: Has additional effect of Poison when used by King Vinegarroon.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

local platoonScorpionPoolID  = 3157
local wildRageDamageIncrease = 0.10

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.1

    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    if mob:getPool() == platoonScorpionPoolID then
        -- should not have to verify because platoon scorps only in battlefield
        local numScorpsDead = mob:getBattlefield():getLocalVar('[ODS]NumScorpsDead')

        -- Increase the strength of Wild Rage as scorps in the BC die
        -- https://ffxiclopedia.fandom.com/wiki/Operation_Desert_Swarm
        info.dmg = info.dmg * (1 + wildRageDamageIncrease * numScorpsDead)
    end

    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)

    -- king vinegrroon
    if mob:getPool() == 2262 then
        invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.POISON, 25, 3, 60)
    end

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
