-----------------------------------
-- Ability: Steal
-- Steal items from enemy.
-- Obtained: Thief Level 5
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.thief.checkSteal(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.thief.useSteal(player, target, ability, action)
end

return abilityObject
