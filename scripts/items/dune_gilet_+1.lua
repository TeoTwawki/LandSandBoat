-----------------------------------
-- ID: 10271
-- Dune Gilet +1
-- Dispense: Berry Snowcone
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BERRY_SNOW_CONE, 1 } })
end

return itemObject
