-----------------------------------
-- ID: 4219
-- Stone Quiver
-- When used, you will obtain one stack of Stone Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.STONE_ARROW, 99 } })
end

return itemObject
