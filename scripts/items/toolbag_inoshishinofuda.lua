-----------------------------------
-- ID: 5867
-- Toolbag Ino
-- When used, you will obtain one stack of inoshishinofuda
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.INOSHISHINOFUDA, 99 } })
end

return itemObject
