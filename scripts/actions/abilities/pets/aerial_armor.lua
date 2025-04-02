-----------------------------------
-- Aerial Armor
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local typeEffect = invaderXim.effect.BLINK
    target:delStatusEffect(typeEffect)

    if target:addStatusEffect(typeEffect, 3, 0, 900) then
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
