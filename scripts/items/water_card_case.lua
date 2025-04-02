-----------------------------------
-- ID: 5407
-- Water Card Case
-- When used, you will obtain one stack of Water Cards
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.WATER_CARD, 99 } })
end

return itemObject
