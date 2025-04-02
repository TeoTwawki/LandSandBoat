-----------------------------------
-- ID: 5410
-- virtue_stone_pouch.lua
-- When used, you will obtain one stack of virtue stone
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.VIRTUE_STONE, 99 } })
end

return itemObject
