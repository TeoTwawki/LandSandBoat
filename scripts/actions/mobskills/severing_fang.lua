-----------------------------------
--  Severing Fang
--
--  Description: Bites at all targets in front. Additional effect: Defense Down
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows
--  Range: Front arc (cone)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- Do not use this weapon skill on targets behind. Sub-Zero Smash
    -- should trigger in this case.
    if target:isBehind(mob) then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 2
    local accmod = 1
    local ftp    = 1.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.DEFENSE_DOWN, 30, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    return dmg
end

return mobskillObject
