-----------------------------------
--  Sub-Zero Smash
--
--  Description: Additional Effect: Paralysis. Damage varies with TP.
--  Type: Physical (blunt)
--  Range: Cone (5' yalms)
--  Notes: This spell should be used anytime the target is behind the mob.
--         However the online documentation suggests that this spell can
--         still be used anytime. As a result, any other Ruszor spells
--         should not trigger if the target is behind the mob.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1  -- Hits once, despite the animation looking like it hits twice.
    local ftp    = 1
    local accmod = 1 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.PARALYSIS, 10, 0, 100)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
