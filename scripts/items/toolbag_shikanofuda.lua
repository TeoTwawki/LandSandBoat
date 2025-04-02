-----------------------------------
-- ID: 5868
-- Toolbag Shika
-- When used, you will obtain one stack of shikanofuda
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.SHIKANOFUDA, 99 } })
end

return itemObject
