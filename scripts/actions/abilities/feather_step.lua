-----------------------------------
-- Ability: Feather Step
-- Description Lowers a target's critical hit evasion. If successful, will earn you a finishing move.
-- Obtained: DNC Level 83
-- Recast Time: 00:00:05 (Step)
-- Duration: 00:01:00
-- Cost: 100TP
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.dancer.checkStepAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return invaderXim.job_utils.dancer.useStepAbility(player, target, ability, action, invaderXim.effect.BEWILDERED_DAZE_1, 2, 6)
end

return abilityObject
