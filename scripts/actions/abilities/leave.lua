-----------------------------------
-- Ability: Leave
-- Sets your pet free.
-- Obtained: Beastmaster Level 35
-- Recast Time: 10 seconds
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.beastmaster.onAbilityCheckNilPet(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    return invaderXim.job_utils.beastmaster.onUseAbilityLeave(player, target, ability)
end

return abilityObject
