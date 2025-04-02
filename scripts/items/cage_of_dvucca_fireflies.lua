-----------------------------------
-- ID: 5346
-- Dvucca Fireflies
-- Transports the user to Dvucca Isle Staging Point
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getZoneID() == invaderXim.zone.PERIQIA then
        return 0
    end

    return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.DVUCCA, 0, 1)
end

itemObject.onItemDrop = function(target, item)
    target:addTempItem(invaderXim.item.CAGE_OF_DVUCCA_FIREFLIES)
end

return itemObject
