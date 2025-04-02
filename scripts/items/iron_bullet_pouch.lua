-----------------------------------
-- ID: 5353
-- Iron Bullet Pouch
-- When used, you will obtain one stack of Iron Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.IRON_BULLET, 99 } })
end

return itemObject
