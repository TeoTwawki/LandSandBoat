-----------------------------------
-- ID: 13173
-- Item: Memento Muffler
-- Item Effect: VIT +7
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.VIT_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MEMENTO_MUFFLER) ~= nil then
        target:delStatusEffect(invaderXim.effect.VIT_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MEMENTO_MUFFLER)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.MEMENTO_MUFFLER) then
        target:addStatusEffect(invaderXim.effect.VIT_BOOST, 7, 0, 300, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MEMENTO_MUFFLER)
    end
end

return itemObject
