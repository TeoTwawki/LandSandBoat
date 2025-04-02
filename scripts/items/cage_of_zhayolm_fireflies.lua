-----------------------------------
-- ID: 5345
-- Item: Zhayolm Fireflies
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getZoneID() == invaderXim.zone.LEBROS_CAVERN then
        return 0
    end

    return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.ZHAYOLM, 0, 1)
end

itemObject.onItemDrop = function(target, item)
    target:addTempItem(invaderXim.item.CAGE_OF_ZHAYOLM_FIREFLIES)
end

return itemObject
