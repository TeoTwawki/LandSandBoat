-----------------------------------
-- Ability: Snake Eye
-- Your next roll will automatically be a 1.
-- Obtained: Corsair Level 75
-- Recast Time: 0:05:00
-- Duration: 0:01:00 or the next usage of Phantom Roll or Double-Up
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.SNAKE_EYE, (player:getMerit(invaderXim.merit.SNAKE_EYE) - 10), 0, 60)

    return invaderXim.effect.SNAKE_EYE
end

return abilityObject
