-----------------------------------
-- ID: 4226
-- Silver Quiver
-- When used, you will obtain one stack of Silver Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.SILVER_ARROW, 99 } })
end

return itemObject
