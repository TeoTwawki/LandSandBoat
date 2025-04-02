-----------------------------------
-- Ability: Trance
-- While in effect, lowers TP cost of dances and steps to 0.
-- Obtained: Dancer Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(invaderXim.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(invaderXim.effect.TRANCE, 1, 0, 60)
    player:addTP(100 * player:getJobPointLevel(invaderXim.jp.TRANCE_EFFECT))
end

return abilityObject
