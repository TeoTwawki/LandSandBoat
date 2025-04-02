-----------------------------------
-- ID: 15867
-- Item: sultans_belt
-- Item Effect: STR +10
-- Duration: 60 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getStatusEffectBySource(invaderXim.effect.STR_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SULTANS_BELT) ~= nil then
        target:delStatusEffect(invaderXim.effect.STR_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SULTANS_BELT)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.SULTANS_BELT) then
        target:addStatusEffect(invaderXim.effect.STR_BOOST, 10, 0, 60, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.SULTANS_BELT)
    end
end

return itemObject
