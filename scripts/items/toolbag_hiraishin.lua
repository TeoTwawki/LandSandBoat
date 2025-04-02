-----------------------------------
-- ID: 5312
-- Toolbag Hira
-- When used, you will obtain one stack of hiraishin
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.HIRAISHIN, 99 } })
end

return itemObject
