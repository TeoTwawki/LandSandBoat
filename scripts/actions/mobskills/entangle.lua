-----------------------------------
-- Entangle
--
-- Description: Attempts to bind a single target with vines.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-- Notes: When used by the Cemetery Cherry and leafless Jidra: it also deals damage, inflicts Poison, and resets hate.
--        When used by Cernunnos: deals damage, also drains HP equal to the damage inflicted.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if mob:getName() == 'Cernunnos' then
        local numhits = 3
        local accmod = 1
        local ftp    = 2.0
        local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
        local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

        invaderXim.mobskills.mobPhysicalDrainMove(mob, target, skill, invaderXim.mobskills.drainType.HP, dmg)

        invaderXim.mobskills.mobPhysicalStatusEffectMove(mob, target, skill,  invaderXim.effect.BIND, 1, 0, 30)

        return dmg
    elseif mob:getPool() == 671 or mob:getPool() == 1346 then -- Cemetery Cherry and leafless Jidra
        local numhits = 3
        local accmod = 1
        local ftp    = 2.0
        local info = invaderXim.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, ftp, invaderXim.mobskills.physicalTpBonus.NO_EFFECT)
        local dmg = invaderXim.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, info.hitslanded)

        mob:resetEnmity(target)
        target:takeDamage(dmg, mob, invaderXim.attackType.PHYSICAL, invaderXim.damageType.SLASHING, { breakBind = false })
        skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30))
        invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.POISON, 50, 0, 60)

        return invaderXim.effect.BIND
    else
        skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.BIND, 1, 0, 30))
        return invaderXim.effect.BIND
    end
end

return mobskillObject
