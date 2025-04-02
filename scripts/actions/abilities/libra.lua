-----------------------------------
-- Ability: Libra
-- Description: Examines the target's enmity level.
-- Obtained: SCH Level 76
-- Recast Time: 00:01:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- player:addStatusEffect(invaderXim.effect.LIBRA, 20, 1, 1) -- TODO: implement invaderXim.effect.LIBRA
end

return abilityObject
