-----------------------------------
-- ID: 16226
-- Pamama Tank
-- When used, you will obtain one Pamama au lait
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.FLASK_OF_PAMAMA_AU_LAIT, 1 } })
end

return itemObject
