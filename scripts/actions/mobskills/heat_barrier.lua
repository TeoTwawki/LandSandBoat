-----------------------------------
-- Heat Barrier
-- Family: Wamouracampa
-- Description: Applies a thermal barrier, granting fiery spikes and fire damage on melee hits.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- TODO: Blaze Spikes reduced power in Salvage zones
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.BLAZE_SPIKES, mob:getMainLvl() * 0.8, 0, 180))
    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ENFIRE, mob:getMainLvl() * 0.4, 0, 300)

    return invaderXim.effect.BLAZE_SPIKES
end

return mobskillObject
