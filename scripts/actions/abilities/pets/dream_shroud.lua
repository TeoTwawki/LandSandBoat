-----------------------------------
-- Dream Shroud
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)
    local bonusTime = utils.clamp(summoner:getSkillLevel(invaderXim.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime
    local hour = VanadielHour()
    local buffvalue = math.abs(12 - hour) + 1
    target:delStatusEffect(invaderXim.effect.MAGIC_ATK_BOOST)
    target:delStatusEffect(invaderXim.effect.MAGIC_DEF_BOOST)
    target:addStatusEffect(invaderXim.effect.MAGIC_ATK_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(invaderXim.effect.MAGIC_DEF_BOOST, 14 - buffvalue, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_MAB_MDB)
    else
        petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_MAB_MDB_2)
    end

    return 0
end

return abilityObject
