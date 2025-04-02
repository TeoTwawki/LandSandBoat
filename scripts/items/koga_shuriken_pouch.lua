-----------------------------------
-- ID: 6300
-- Item: Koga Shr. Pouch
-- When used, you will obtain one stack of Koga Shurikens
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.KOGA_SHURIKEN, 99 } })
end

return itemObject
