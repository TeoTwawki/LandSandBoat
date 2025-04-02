-----------------------------------
-- Sand Trap
-- Description: AOE Petrify and resets hate.
-- Type: Physical
-- Utsusemi/Blink absorb: Ignore
-- Range: 15' radial
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.PETRIFICATION, 1, 0, math.random(12, 20)))

    -- reset everyones enmity
    mob:resetEnmity(target)

    return invaderXim.effect.PETRIFICATION
end

return mobskillObject
