-----------------------------------
-- Queasyshroom
-- Additional effect: Poison. Duration of effect varies with TP.
-- Range is 13.5 yalms.
-- Piercing damage Ranged Attack.
-- Secondary modifiers: INT: 20%.
-- Additional Effect: Poison is based on level
-- Poison effect may resist
-- Removes all Shadow Images on the target.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getMobMod(invaderXim.mobMod.VAR) == 0 then
        return 0
    end

    return 1
end

-- TODO: can crit
mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    mob:setMobMod(invaderXim.mobMod.VAR, 1)
    local numhits = 1
    local accmod = 1
    local ftp    = 1.5
    local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT, 0, 0, 0)
    local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING, invaderXim.mobskills.shadowBehavior.WIPE_SHADOWS)
    local power = mob:getMainLvl() / 10 + 1

    invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill, invaderXim.effect.POISON, power, 3, 60)

    target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.PIERCING)
    return dmg
end

return mobskillObject
