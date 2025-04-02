-----------------------------------
-- ID: 5343
-- Azouph Fireflies
-- Transports the user to Azouph Isle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getZoneID() == invaderXim.zone.LEUJAOAM_SANCTUM then
        return 0
    end

    return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.AZOUPH, 0, 1)
end

itemObject.onItemDrop = function(target, item)
    target:addTempItem(invaderXim.item.CAGE_OF_AZOUPH_FIREFLIES)
end

return itemObject
