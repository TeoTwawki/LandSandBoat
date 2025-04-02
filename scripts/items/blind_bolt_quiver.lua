-----------------------------------
-- ID: 5334
-- Item: Blind Bolt Quiver
-- When used, you will obtain one stack of Blind Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BLIND_BOLT, 99 } })
end

return itemObject
