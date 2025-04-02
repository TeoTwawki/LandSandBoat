-----------------------------------
-- ID: 15956
-- Temple Knight's Quiver
-- When used, you will obtain one Temple Knight's Arrow
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.TEMPLE_KNIGHTS_ARROW, 1 } })
end

return itemObject
