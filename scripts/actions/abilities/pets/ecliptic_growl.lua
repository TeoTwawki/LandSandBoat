-----------------------------------
-- Ecliptic Growl
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local bonusTime = utils.clamp(summoner:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local moon = VanadielMoonPhase()
    local buffvalue = 1
    if moon > 90 then
        buffvalue = 7
    elseif moon > 75 then
        buffvalue = 6
    elseif moon > 60 then
        buffvalue = 5
    elseif moon > 40 then
        buffvalue = 4
    elseif moon > 25 then
        buffvalue = 3
    elseif moon > 10 then
        buffvalue = 2
    end

    target:delStatusEffect(invaderXim.effect.STR_BOOST)
    target:delStatusEffect(invaderXim.effect.DEX_BOOST)
    target:delStatusEffect(invaderXim.effect.VIT_BOOST)
    target:delStatusEffect(invaderXim.effect.AGI_BOOST)
    target:delStatusEffect(invaderXim.effect.MND_BOOST)
    target:delStatusEffect(invaderXim.effect.CHR_BOOST)

    target:addStatusEffect(invaderXim.effect.STR_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.DEX_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.VIT_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.AGI_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.INT_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.MND_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.CHR_BOOST, 8-buffvalue, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.STATUS_BOOST)
    else
        petskill:setMsg(invaderXim.msg.basic.STATUS_BOOST_2)
    end

    return 0
end

return abilityObject
