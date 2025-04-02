-----------------------------------
-- ID: 5866
-- Toolbag Moku
-- When used, you will obtain one stack of mokujin
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MOKUJIN, 99 } })
end

return itemObject
