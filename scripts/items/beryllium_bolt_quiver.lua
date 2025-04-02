-----------------------------------
-- ID: 6428
-- Beryllium Bolt Quiver
-- When used, you will obtain one stack of Beryllium Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BERYLLIUM_BOLT, 99 } })
end

return itemObject
