-----------------------------------
-- ID: 13688
-- Hi-Potion Tank
-- When used, you will obtain one Hi-Potion
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.HI_POTION, 1 } })
end

return itemObject
