-----------------------------------
-- ID: 5822
-- Dweomer Bullet Pouch
-- When used, you will obtain one stack of Dweomer Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DWEOMER_BULLET, 99 } })
end

return itemObject
