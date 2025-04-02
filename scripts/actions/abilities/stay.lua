-----------------------------------
-- Ability: Stay
-- Commands the Pet to stay in one place.
-- Obtained: Beastmaster Level 15
-- Recast Time: 5 seconds
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.beastmaster.onAbilityCheckNilPet(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.beastmaster.onUseAbilityStay(player, target, ability)
end

return abilityObject
