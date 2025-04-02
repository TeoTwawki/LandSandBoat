-----------------------------------
-- ID: 5404
-- Wind Card Case
-- When used, you will obtain one stack of Wind Cards
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.WIND_CARD, 99 } })
end

return itemObject
