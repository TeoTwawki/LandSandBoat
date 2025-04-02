-----------------------------------
-- ID: 5313
-- Toolbag Mizu
-- When used, you will obtain one stack of mizu-deppo
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MIZU_DEPPO, 99 } })
end

return itemObject
