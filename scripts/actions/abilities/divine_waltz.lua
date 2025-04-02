-----------------------------------
-- Ability: Divine Waltz
-- Heals party members within area of effect.
-- Obtained: Dancer Level 25
-- TP Required: 40%
-- Recast Time: 00:13
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
