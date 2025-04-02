-----------------------------------
-- ID: 4107
-- Earth Cluster
-- Turn into a stack of earth crystals
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.EARTH_CRYSTAL, 12 } })
end

return itemObject
