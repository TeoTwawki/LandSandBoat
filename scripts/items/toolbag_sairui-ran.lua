-----------------------------------
-- ID: 5317
-- Toolbag Sai
-- When used, you will obtain one stack of sairui-ran
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.SAIRUI_RAN, 99 } })
end

return itemObject
