-----------------------------------
-- Holy Mist
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local dint = pet:getStat(invaderXim.mod.INT) - target:getStat(invaderXim.mod.INT)
    local dmg = 600 + dint * 1.5 + pet:getTP() / 20

    invaderXim.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    target:updateEnmityFromDamage(pet, dmg)
    target:takeDamage(dmg, pet, invaderXim.attackType.MAGICAL, invaderXim.damageType.LIGHT)
    return dmg
end

return abilityObject
