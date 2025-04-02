-----------------------------------
-- ID: 15957
-- Iron Musketeer's Quiver
-- When used, you will obtain one Iron Musketeer's Bolt
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.IRON_MUSKETEERS_BOLT, 1 } })
end

return itemObject
