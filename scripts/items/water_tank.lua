-----------------------------------
--  ID: 13683
--  Water Tank
--  When used, you will obtain one stack of Distilled Water
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FLASK_OF_DISTILLED_WATER, 12 } })
end

return itemObject
