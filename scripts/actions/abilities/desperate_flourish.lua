-----------------------------------
-- Ability: Desperate Flourish
-- Weighs down a target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 30
-- Finishing Moves Used: 1
-- Recast Time: 00:20
-- Duration: ??
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.dancer.checkFlourishAbility(player, target, ability, true, 1)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.dancer.useDesperateFlourishAbility(player, target, ability, action)
end

return abilityObject
