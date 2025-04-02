-----------------------------------
-- ID: 5871
-- Ruszor Quiver
-- When used, you will obtain one stack of Ruszor Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.RUSZOR_ARROW, 99 } })
end

return itemObject
