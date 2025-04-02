-----------------------------------
-- ID: 4225
-- Iron Quiver
-- When used, you will obtain one stack of Iron Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.IRON_ARROW, 99 } })
end

return itemObject
