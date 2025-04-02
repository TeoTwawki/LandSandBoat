-----------------------------------
-- Lunar Roar
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local effect = target:dispelStatusEffect()
    if effect == invaderXim.effect.NONE then
        petskill:setMsg(invaderXim.msg.basic.JA_NO_EFFECT_2)
    else
        target:dispelStatusEffect()
        petskill:setMsg(invaderXim.msg.basic.NONE)
    end

    return 0
end

return abilityObject
