-----------------------------------
-- Ability: Decoy Shot
-- Description: Diverts enmity when launching a ranged attack from behind a party member.
-- Obtained: RNG Level 95
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkDecoyShot(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useDecoyShot(player, target, ability, action)
end

return abilityObject
