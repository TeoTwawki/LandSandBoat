-----------------------------------
-- ID: 15863
-- Item: samsonian_belt
-- Item Effect: STR +3
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.STR_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SAMSONIAN_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.STR_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SAMSONIAN_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.SAMSONIAN_BELT) then
        target:addStatusEffect(invaderXim.effect.STR_BOOST, 3, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SAMSONIAN_BELT)
    end
end

return itemObject
