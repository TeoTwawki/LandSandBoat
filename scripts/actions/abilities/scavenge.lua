-----------------------------------
-- Ability: Scavenge
-- Searches the ground around user for items.
-- Obtained: Ranger Level 10
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkScavenge(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useScavenge(player, target, ability, action)
end

return abilityObject
