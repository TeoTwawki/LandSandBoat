-----------------------------------
-- ID: 5912
-- Gargouille Quiver
-- When used, you will obtain one stack of Gargouille Arrow
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.GARGOUILLE_ARROW, 99 } })
end

return itemObject
