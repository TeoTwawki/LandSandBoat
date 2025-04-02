-----------------------------------
-- ID: 6414
-- Porxie Quiver
-- When used, you will obtain one stack of Porxie Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.PORXIE_ARROW, 99 } })
end

return itemObject
