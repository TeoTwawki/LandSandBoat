-----------------------------------
-- ID: 15782
-- Item: Manashell Ring
-- Item Effect: MP +9
-- Duration: 3 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target)
    if target:getStatusEffectBySource(invaderXim.effect.MAX_MP_BOOST, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MANASHELL_RING) ~= nil then
        target:delStatusEffect(invaderXim.effect.MAX_MP_BOOST, nil, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MANASHELL_RING)
    end

    return 0
end

itemObject.onItemUse = function(target)
    if target:hasEquipped(invaderXim.item.MANASHELL_RING) then
        target:addStatusEffect(invaderXim.effect.MAX_MP_BOOST, 9, 0, 180, 0, 0, 0, invaderXim.effectSourceType.EQUIPPED_ITEM, invaderXim.item.MANASHELL_RING)
    end
end

return itemObject
