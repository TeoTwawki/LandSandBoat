-----------------------------------
-- ID: 6266
-- Toolbag Furu
-- When used, you will obtain one stack of Furusumi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FURUSUMI, 99 } })
end

return itemObject
