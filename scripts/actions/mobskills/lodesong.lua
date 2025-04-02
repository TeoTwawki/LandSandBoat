-----------------------------------
-- Lodesong
-- Description: Weighs down targets in an area of effect.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- can only used if not silenced
    if
        mob:getMainJob() == invaderXim.job.BRD and
        not mob:hasStatusEffect(invaderXim.effect.SILENCE)
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobStatusEffectMove(mob, target, invaderXim.effect.WEIGHT, 50, 0, 50))

    return nil
end

return mobskillObject
