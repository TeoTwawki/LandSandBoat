-----------------------------------
-- ID: 5311
-- Toolbag Maki
-- When used, you will obtain one stack of makibishi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MAKIBISHI, 99 } })
end

return itemObject
