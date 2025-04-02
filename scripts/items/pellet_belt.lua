-----------------------------------
--   ID: 15288
--   Pellet Belt
--   When used, you will obtain 12 Pebbles
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.PEBBLE, 12 } })
end

return itemObject
