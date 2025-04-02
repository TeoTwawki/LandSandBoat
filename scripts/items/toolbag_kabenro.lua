-----------------------------------
-- ID: 5863
-- Toolbag Kaben
-- When used, you will obtain one stack of kabenro
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.KABENRO, 99 } })
end

return itemObject
