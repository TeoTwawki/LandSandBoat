-----------------------------------
-- ID: 5278
-- Old Bolt Box
-- When used, you will obtain one partial stack of Dogbolt
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DOGBOLT, math.random(10, 20) } })
end

return itemObject
