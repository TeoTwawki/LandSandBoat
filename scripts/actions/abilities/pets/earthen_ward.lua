-----------------------------------
-- Earthen Ward
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    target:delStatusEffect(invaderXim.effect.STONESKIN)
    local amount = pet:getMainLvl() * 2 + 50

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local typeEffect = invaderXim.effect.STONESKIN
    if target:addStatusEffect(typeEffect, amount, 0, 900, 0, 0, 3) then
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT_2)
        else
            petskill:setMsg(invaderXim.msg.basic.JA_GAIN_EFFECT)
        end
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        return
    end

    return typeEffect
end

return abilityObject
