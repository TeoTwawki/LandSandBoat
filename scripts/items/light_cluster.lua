-----------------------------------
-- ID: 4110
-- Light Cluster
-- Turn into a stack of light crystals
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.LIGHT_CRYSTAL, 12 } })
end

return itemObject
