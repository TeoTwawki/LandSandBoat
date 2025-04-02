-----------------------------------
-- ID: 5333
-- Sleep Quiver
-- When used, you will obtain one stack of Sleep Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.SLEEP_ARROW, 99 } })
end

return itemObject
