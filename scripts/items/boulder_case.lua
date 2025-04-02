-----------------------------------
-- ID: 6182
-- Boulder Case
-- Breaks up a Boulder Case
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.RIFTBORN_BOULDER, math.random(3, 15) } })
end

return itemObject
