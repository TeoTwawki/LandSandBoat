-----------------------------------
-- Ability: Quickstep
-- Lowers target's evasion. If successful, you will earn two Finishing Moves.
-- Obtained: Dancer Level 20
-- TP Required: 10%
-- Recast Time: 00:05
-- Duration: First Step lasts 1 minute, each following Step extends its current duration by 30 seconds.
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.dancer.checkStepAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.dancer.useStepAbility(player, target, ability, action, invaderXim.effect.LETHARGIC_DAZE_1, 1, 5)
end

return abilityObject
