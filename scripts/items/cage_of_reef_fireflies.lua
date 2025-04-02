-----------------------------------
-- ID: 5347
-- Reef Fireflies
-- Transports the user to Ilrusi Atoll Staging Point
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getZoneID() == invaderXim.zone.ILRUSI_ATOLL then
        return 0
    end

    return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.REEF, 0, 1)
end

itemObject.onItemDrop = function(target, item)
    target:addTempItem(invaderXim.item.CAGE_OF_REEF_FIREFLIES)
end

return itemObject
