-----------------------------------
-- Reraise II
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    if
        not target:isPC() or
        not target:addStatusEffect(invaderXim.effect.RERAISE, 2, 0, 3600)
    then
        petskill:setMsg(invaderXim.msg.basic.NO_EFFECT)
        return 0
    end

    petskill:setMsg(invaderXim.msg.basic.SKILL_GAIN_EFFECT_2)

    return invaderXim.effect.RERAISE
end

return abilityObject
