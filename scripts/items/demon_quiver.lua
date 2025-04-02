-----------------------------------
-- ID: 4224
-- Demon Quiver
-- When used, you will obtain one stack of Demon Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DEMON_ARROW, 99 } })
end

return itemObject
