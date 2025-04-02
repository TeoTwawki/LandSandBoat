-----------------------------------
--  ID: 16225
--  Pear au lait Tank
--  When used, you will obtain one Pear au lait
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FLASK_OF_PEAR_AU_LAIT, 1 } })
end

return itemObject
