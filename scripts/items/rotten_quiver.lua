-----------------------------------
-- ID: 4196
-- Rotten Quiver
-- When used, you will obtain 18 Old Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.OLD_ARROW, 99 } })
end

return itemObject
