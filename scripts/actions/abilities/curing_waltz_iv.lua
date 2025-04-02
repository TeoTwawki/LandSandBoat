-----------------------------------
-- Ability: Curing Waltz IV
-- Heals HP to target player.
-- Obtained: Dancer Level 70
-- TP Required: 65%
-- Recast Time: 00:17
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.dancer.useWaltzAbility(player, target, ability, action)
end

return abilityObject
