-----------------------------------
-- ID: 5736
-- Lin. Purse (Alx.)
-- Breaks up a Linen Purse
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.ALEXANDRITE, math.random(50, 99) } })
end

return itemObject
