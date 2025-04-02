-----------------------------------
-- ID: 5409
-- Dark Card Case
-- When used, you will obtain one stack of Dark Cards
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DARK_CARD, 99 } })
end

return itemObject
