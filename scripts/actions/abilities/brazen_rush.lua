-----------------------------------
-- Ability: Brazen Rush
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.warrior.checkBrazenRush(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    invaderXim.job_utils.warrior.useBrazenRush(player, target, ability)
end

return abilityObject
