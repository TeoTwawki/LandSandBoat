-----------------------------------
-- ID: 5315
-- Toolbag Jusa
-- When used, you will obtain one stack of jusatsu
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.JUSATSU, 99 } })
end

return itemObject
