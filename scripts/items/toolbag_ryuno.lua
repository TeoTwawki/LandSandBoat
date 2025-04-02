-----------------------------------
-- ID: 5865
-- Toolbag Ryuno
-- When used, you will obtain one stack of ryuno
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.RYUNO, 99 } })
end

return itemObject
