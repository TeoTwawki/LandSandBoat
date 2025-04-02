-----------------------------------
-- ID: 4228
-- Mythril Bolt Quiver
-- When used, you will obtain one stack of Mythril Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MYTHRIL_BOLT, 99 } })
end

return itemObject
