-----------------------------------
-- ID: 6420
-- Voluspa Quiver
-- When used, you will obtain one stack of Voluspa Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.VOLUSPA_ARROW, 99 } })
end

return itemObject
