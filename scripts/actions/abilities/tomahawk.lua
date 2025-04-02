-----------------------------------
-- Ability: Tomahawk
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.warrior.checkTomahawk(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    invaderXim.job_utils.warrior.useTomahawk(player, target, ability)
end

return abilityObject
