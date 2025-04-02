-----------------------------------
-- Ability: Divine Waltz II
-- Restores the HP of all party members within a small radius.
-- Obtained: Dancer Level 78
-- TP Required: 80%
-- Recast Time: 00:20
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
