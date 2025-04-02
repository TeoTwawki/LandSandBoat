-----------------------------------
--  ID: 16223
--  Orange au lait Tank
--  When used, you will obtain one Orange au lait
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FLASK_OF_ORANGE_AU_LAIT, 1 } })
end

return itemObject
