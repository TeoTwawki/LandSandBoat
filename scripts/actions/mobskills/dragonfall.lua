-----------------------------------
--  Dragonfall
--
--  Description: Deals damage to players an area of effect. Additional effect: Bind
--  Type: Physical
--  2-3 Shadows
--  Range: Melee
-- Special weaponskill unique to Ark Angel GK. Deals ~100-300 damage.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- TODO: Can skillchain?  Unknown property.

    local numhits = 1
    local accmod = 1
    local ftp    = 2.7
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_2)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, { breakBind = false })
    return dmg
end

return mobskillObject
