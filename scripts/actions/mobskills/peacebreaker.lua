-----------------------------------
-- Peacebreaker
-- Description: Deals damage and increases magic damage taken by target
-- Peacebreaker increases Magic Damage Taken on the target (~2x Magic Damage),
-- making Naja a good fit with offensive magic jobs such as Rune Fencer.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 2.0 -- fTP and fTP scaling unknown. TODO: capture ftp
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT, info.hitslanded)

    -- TODO: This should be Increases Magic Damage Taken, but this was faster/easier
    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.MAGIC_DEF_DOWN, 50, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.BLUNT)
    return dmg
end

return mobskillObject
