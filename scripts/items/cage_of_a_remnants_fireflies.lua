-----------------------------------
-- ID: 5399
-- A. Rem. Fireflies
-- Transports the user out of Arrapago Remnants
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getZoneID() == invaderXim.zone.ARRAPAGO_REMNANTS then
        return 0
    end

    return invaderXim.msg.basic.ITEM_UNABLE_TO_USE_2
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(invaderXim.effect.TELEPORT, 0, invaderXim.teleport.id.A_REM, 0, 1)
end

itemObject.onItemDrop = function(target, item)
    target:addTempItem(invaderXim.item.CAGE_OF_A_REMNANTS_FIREFLIES)
end

return itemObject
