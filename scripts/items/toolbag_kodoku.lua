-----------------------------------
-- ID: 5318
-- Toolbag Kodo
-- When used, you will obtain one stack of Kodo
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.KODOKU, 99 } })
end

return itemObject
