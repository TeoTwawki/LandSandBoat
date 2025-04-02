-----------------------------------
-- Ability: Sharpshot
-- Increases ranged accuracy.
-- Obtained: Ranger Level 1
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkSharpshot(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useSharpshot(player, target, ability, action)
end

return abilityObject
