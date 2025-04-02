-----------------------------------
-- Gust Breath
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(pet, target, skill, action)
    return invaderXim.job_utils.dragoon.useDamageBreath(pet, target, skill, action, invaderXim.damageType.WIND)
end

return abilityObject
