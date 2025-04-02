-----------------------------------
-- Ability: Climactic Flourish
-- Description: Allows you to deal critical hits. Requires at least one finishing move.
-- Obtained: DNC Level 80
-- Recast Time: 00:01:30 (Flourishes III)
-- Duration: 00:01:00
-- Cost: 1-5 Finishing Move charges
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_1) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_2) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_3) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_4) or
        player:hasStatusEffect(invaderXim.effect.FINISHING_MOVE_5)
    then
        return 0, 0
    end

    return invaderXim.msg.basic.NO_FINISHINGMOVES, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    for move = invaderXim.effect.FINISHING_MOVE_1, invaderXim.effect.FINISHING_MOVE_5 do
        player:delStatusEffect(move)
        player:addStatusEffect(invaderXim.effect.CLIMACTIC_FLOURISH, 3, 0, 60) -- TODO: player:getMerit(invaderXim.merit.CLIMACTIC_FLOURISH_EFFECT) This was here and maybe it refered to FLOURISH_III job points?
    end
end

return abilityObject
