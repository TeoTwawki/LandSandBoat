-----------------------------------
-- Reactor Cool
-- Gives Undispellable Ice Spikes and Defense Boost
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() > 1 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.ICE_SPIKES, math.random(15, 30), 0, 60))

    local effect1 = mob:getStatusEffect(invaderXim.effect.ICE_SPIKES)
    if effect1 then
        effect1:delEffectFlag(invaderXim.effectFlag.DISPELABLE)
    end

    invaderXim.mobskills.mobBuffMove(mob, invaderXim.effect.DEFENSE_BOOST, 26, 0, 60)

    local effect2 = mob:getStatusEffect(invaderXim.effect.DEFENSE_BOOST)
    if effect2 then
        effect2:delEffectFlag(invaderXim.effectFlag.DISPELABLE)
    end

    return invaderXim.effect.ICE_SPIKES
end

return mobskillObject
