-----------------------------------
--  Guillotine
--
--  Description: Delivers a four-hit attack. Silences enemy. Duration of effect varies with TP.
--  Type: Physical
--  Number of hits
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    mob:messageBasic(invaderXim.msg.basic.READIES_WS, 0, 689 + 256)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local ftp    = 1.2
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SILENCE, 1, 0, (skill:getTP() * 30 / 1000) + 30)

    -- 242 to a NIN, but shadows ate some hits
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)
    return dmg
end

return mobskillObject
