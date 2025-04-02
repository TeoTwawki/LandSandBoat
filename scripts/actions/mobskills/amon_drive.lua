-----------------------------------
-- Amon Drive
--
-- Description: Performs an area of effect weaponskill. Additional effect: Paralysis + Petrification + Poison
-- Type: Physical
-- 2-3 Shadows?
-- Range: Melee range radial
-- Special weaponskill unique to Ark Angel TT. Deals ~100-400 damage.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local ftp     = 2.5
    local info    = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
    local dmg     = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, invaderXim.mobskills.shadowBehavior.NUMSHADOWS_3)

    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PARALYSIS, 25, 0, 60)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, math.random(8, 15) + mob:getMainLvl() / 3)
    invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, math.ceil(mob:getMainLvl() / 5), 3, 60)
    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING)

    return dmg
end

return mobskillObject
