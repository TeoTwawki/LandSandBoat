-----------------------------------
-- ID: 10253
-- Decennial Coat +1
-- Dispense: Bowl of Moogurt
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BOWL_OF_MOOGURT, 1 } })
end

return itemObject
