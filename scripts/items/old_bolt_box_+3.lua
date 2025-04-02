-----------------------------------
-- ID: 5281
-- Old Bolt Box +3
-- When used, you will obtain one partial stack of Dogbolt +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DOGBOLT_P3, math.random(10, 20) } })
end

return itemObject
