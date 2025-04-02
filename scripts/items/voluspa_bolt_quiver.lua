-----------------------------------
-- ID: 6429
-- Voluspa Volt Quiver
-- When used, you will obtain one stack of Voluspa Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.VOLUSPA_BOLT, 99 } })
end

return itemObject
