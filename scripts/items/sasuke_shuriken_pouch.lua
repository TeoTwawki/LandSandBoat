-----------------------------------
-- ID: 6447
-- Sasu. Sh. Pouch
-- A small leather pouch made for storing sasuke shuriken.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.SASUKE_SHURIKEN, 99 } })
end

return itemObject
