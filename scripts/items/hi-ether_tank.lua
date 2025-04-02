-----------------------------------
-- ID: 13689
-- Hi-Ether Tank
-- When used, you will obtain one hi-ether
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.HI_ETHER, 1 } })
end

return itemObject
