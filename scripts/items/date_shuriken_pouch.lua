-----------------------------------
-- ID: 6449
-- Date Suriken Pouch
-- A small leather pouch made for storing Date Suriken.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DATE_SHURIKEN, 99 } })
end

return itemObject
