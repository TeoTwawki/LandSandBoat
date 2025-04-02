-----------------------------------
-- Horror Cloud
--
-- Description: A debilitating cloud slows the attack speed of a single target.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Melee
-- Notes: Can be overwritten and blocked by Haste.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.SLOW, 1250, 0, 180))

    return invaderXim.effect.SLOW
end

return mobskillObject
