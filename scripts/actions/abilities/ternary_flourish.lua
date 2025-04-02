-----------------------------------
-- Ability: Ternary Flourish
-- Description: Allows you to deliver a threefold attack. Requires at least three finishing moves.
-- Obtained: DNC Level 93
-- Recast Time: 00:00:45 (Flourishes III)
-- Duration: 00:01:00
-- Cost: 3 Finishing Move charges
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_5)
    then
        return 0, 0
    end

    return invaderXim.msg.basic.NO_FINISHINGMOVES, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    if player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_3) then
        player:delStatusEffect(invaderXim.effect.FINISHING_MOVE_3)
        player:addStatusEffect(invaderXim.effect.TERNARY_FLOURISH, 3, 0, 60)
    elseif player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_4) then
        player:delStatusEffect(invaderXim.effect.FINISHING_MOVE_4)
        player:addStatusEffect(invaderXim.effect.FINISHING_MOVE_1, 1, 0, 7200)
        player:addStatusEffect(invaderXim.effect.TERNARY_FLOURISH, 3, 0, 60)
    elseif player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_5) then
        player:delStatusEffect(invaderXim.effect.FINISHING_MOVE_5)
        player:addStatusEffect(invaderXim.effect.FINISHING_MOVE_2, 1, 0, 7200)
        player:addStatusEffect(invaderXim.effect.TERNARY_FLOURISH, 3, 0, 60)
    end
end

return abilityObject
