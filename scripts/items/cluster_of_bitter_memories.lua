-----------------------------------
-- ID: 5287
-- Cluster of bitter memories
-- Turn into a stack of bitter memories
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BITTER_MEMORY, 12 } })
end

return itemObject
