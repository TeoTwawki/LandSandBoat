-----------------------------------
-- Ability: Shadowbind
-- Roots enemy in place.
-- Obtained: Ranger Level 40
-- Recast Time: 5:00
-- Duration: 00:30
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.ranger.checkShadowbind(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.ranger.useShadowbind(player, target, ability, action)
end

return abilityObject
