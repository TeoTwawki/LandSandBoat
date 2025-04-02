-----------------------------------
-- Ability: Eagle Eye Shot
-- Delivers a powerful and accurate ranged attack.
-- Obtained: Ranger Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkEagleEyeShot(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useEagleEyeShot(player, target, ability, action)
end

return abilityObject
