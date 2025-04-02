-----------------------------------
-- ID: 5406
-- Thunder Card Case
-- When used, you will obtain one stack of Thunder Cards
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.THUNDER_CARD, 99 } })
end

return itemObject
