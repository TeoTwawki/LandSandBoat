-----------------------------------
-- ID: 5308
-- Toolbag Uchi
-- When used, you will obtain one stack of uchitake
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.UCHITAKE, 99 } })
end

return itemObject
