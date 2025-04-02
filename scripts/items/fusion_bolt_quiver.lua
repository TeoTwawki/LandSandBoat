-----------------------------------
-- ID: 5821
-- Fusion Bolt Quiver
-- When used, you will obtain one stack of Fusion Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FUSION_BOLT, 99 } })
end

return itemObject
