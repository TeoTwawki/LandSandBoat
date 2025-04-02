-----------------------------------
-- ID: 5820
-- Darkling Bolt Quiver
-- When used, you will obtain one stack of Darkling Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DARKLING_BOLT, 99 } })
end

return itemObject
