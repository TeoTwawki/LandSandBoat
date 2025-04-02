-----------------------------------
-- ID: 4109
-- Water Cluster
-- Turn into a stack of water crystals
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.WATER_CRYSTAL, 12 } })
end

return itemObject
