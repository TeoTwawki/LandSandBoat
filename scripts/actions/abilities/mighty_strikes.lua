-----------------------------------
-- Ability: Mighty Strikes
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return invaderXim.job_utils.warrior.checkMightyStrikes(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    invaderXim.job_utils.warrior.useMightyStrikes(player, target, ability)
end

return abilityObject
