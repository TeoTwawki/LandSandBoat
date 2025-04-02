-----------------------------------
-- Stifling Tantara
--
-- Description: Inflicts silence in an area of effect and deals damage.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Strips shadows
-- Range: 10' as well as single target outside of 10'
-- Notes: Doesn't use this if its horn is broken. Used only by certain Imp NMs, in place of Deafening Tantara.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 5 and mob:getFamily() == 165 then -- Imps without horn
        return 1
    else
        return 0
    end
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local ftp    = 3.0
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.SILENCE, 1, 0, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.MAGICAL, invaderXim.damageType.ELEMENTAL)
    return dmg
end

return mobskillObject
