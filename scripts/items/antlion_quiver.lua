-----------------------------------
-- ID: 5819
-- Item: Antlion Quiver
-- When used, you will obtain one stack of Antlion Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.ANTLION_ARROW, 99 } })
end

return itemObject
