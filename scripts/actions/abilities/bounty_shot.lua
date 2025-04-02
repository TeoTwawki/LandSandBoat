-----------------------------------
-- Ability: Bounty Shot
-- Description: Increases the rate at which the target yields treasure.
-- Obtained: RNG Level 87
-- Recast Time: 00:01:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkBountyShot(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useBountyShot(player, target, ability, action)
end

return abilityObject
