-----------------------------------
-- Skullbreaker
--
-- Description: Lowers enemy's INT. Chance of lowering INT varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow
-- Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    mob:messageBasic(invaderXim.msg.basic.READIES_WS, 0, 165)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.0
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 1.1, 1.2, 1.3)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    if math.random(1, 100) < skill:getTP() / 3 then
        invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.INT_DOWN, 10, 3, 120)
    end

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
