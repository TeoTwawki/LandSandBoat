-----------------------------------
-- ID: 6265
-- Toolbag Ranka
-- When used, you will obtain one stack of Ranka
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.RANKA, 99 } })
end

return itemObject
