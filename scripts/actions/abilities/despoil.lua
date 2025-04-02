-----------------------------------
-- Ability: Despoil
-- Steal items and debuffs enemy.
-- Obtained: Thief Level 77
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.thief.checkDespoil(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.thief.useDespoil(player, target, ability, action)
end

return abilityObject
