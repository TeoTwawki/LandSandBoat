-----------------------------------
-- ID: 6180
-- Pluton Case
-- Breaks up a Pluton Case
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.PLUTON, math.random(3, 15) } })
end

return itemObject
