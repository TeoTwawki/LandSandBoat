-----------------------------------
-- Tidal Roar
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    if not target:getStatusEffect(invaderXim.effect.ATTACK_DOWN) then
        target:addStatusEffect(invaderXim.effect.ATTACK_DOWN, 25, 0, 60)

        -- The status effect requires the NO_LOSS_MESSAGE flag to be set
        local statusEffect = target:getStatusEffect(invaderXim.effect.ATTACK_DOWN)
        if statusEffect then
            statusEffect:addEffectFlag(invaderXim.effectFlag.NO_LOSS_MESSAGE)
        end

        -- TODO: Verify enmity gain total
        target:addEnmity(pet, 1, 60)

        -- TODO: Refactor this logic globally for pet abilities
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT_2)
        else
            petskill:setMsg(invaderXim.msg.basic.JA_RECEIVES_EFFECT)
        end
    else
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
        return
    end

    return invaderXim.effect.ATTACK_DOWN
end

return abilityObject
