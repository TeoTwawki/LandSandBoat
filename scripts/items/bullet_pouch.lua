-----------------------------------
-- ID: 5363
-- Item: Bullet Pouch
-- When used, you will obtain one stack of Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.BULLET, 99 } })
end

return itemObject
