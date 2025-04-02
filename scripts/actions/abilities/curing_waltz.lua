-----------------------------------
-- Ability: Curing Waltz
-- Heals HP to target player.
-- Obtained: Dancer Level 15
-- TP Required: 20%
-- Recast Time: 00:06
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
