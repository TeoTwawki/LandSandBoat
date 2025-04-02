-----------------------------------
-- ID: 15865
-- Item: runners_belt
-- Item Effect: DEX +3
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.DEX_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RUNNERS_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.DEX_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RUNNERS_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.RUNNERS_BELT) then
        target:addStatusEffect(invaderXim.effect.DEX_BOOST, 3, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.RUNNERS_BELT)
    end
end

return itemObject
