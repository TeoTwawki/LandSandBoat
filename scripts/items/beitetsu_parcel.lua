-----------------------------------
-- ID: 6181
-- Beitetsu Parcel
-- Breaks up a Beitetsu Parcel
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BEITETSU, math.random(3, 15) } })
end

return itemObject
