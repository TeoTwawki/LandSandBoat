-----------------------------------
-- ID: 5339
-- Item: Bloody Bolt Quiver
-- When used, you will obtain one stack of Bloody Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BLOODY_BOLT, 99 } })
end

return itemObject
