-----------------------------------
-- ID: 5255
-- Item: Hermes Quencher
-- Item Effect: Flee for 30 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(invaderXim.effect.MEDICINE) then
        return invaderXim.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(invaderXim.effect.FLEE)
    target:addStatusEffect(invaderXim.effect.FLEE, 8750, 0, 30)
    target:messageBasic(invaderXim.msg.basic.GAINS_EFFECT_OF_STATUS, invaderXim.effect.FLEE)
    target:addStatusEffect(invaderXim.effect.MEDICINE, 0, 0, 900)
end

return itemObject
