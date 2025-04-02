-----------------------------------
-- Ability: Repair
-- Uses oil to restore pet's HP.
-- Obtained: Puppetmaster Level 15
-- Recast Time: 3:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.puppetmaster.onAbilityCheckRepair(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    return invaderXim.job_utils.puppetmaster.onAbilityUseRepair(player, target, ability)
end

return abilityObject
