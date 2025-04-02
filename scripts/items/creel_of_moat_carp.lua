-----------------------------------
-- ID: 5810
-- Item: Creel of Moat Carp
-- When used, you will obtain 6-12 Moat Carp
-----------------------------------
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { invaderXim.item.MOAT_CARP, math.random(6, 12) } })
end

return itemObject
