-----------------------------------
-- ID: 6437
-- Divine Bullet Pouch
-- When used, you will obtain one stack of Divine Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.DIVINE_BULLET, 99 } })
end

return itemObject
