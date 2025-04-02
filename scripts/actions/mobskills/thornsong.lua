-----------------------------------
-- Thornsong
-- Description: Covers the user in fiery spikes. Enemies that hit it take fire damage.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- can only use if not silenced
    if
        mob:getMainJob() == invaderXim.job.BRD and
        not mob:hasStatusEffect(invaderXim.effect.SILENCE)
    then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = mob:getMainLvl() * 2
    local duration = 180
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLAZE_SPIKES, power, 0, duration))
    return invaderXim.effect.BLAZE_SPIKES
end

return mobskillObject
