-----------------------------------
-- Raise II
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    if not target:isPC() or target:isAlive() then
        petskill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        return 0
    end

    petskill:setMsg(invaderXim.msg.basic.NONE)
    target:sendRaise(2)
    return 0
end

return abilityObject
