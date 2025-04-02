-----------------------------------
--  ID: 26720
--  Sheep Cap +1
--  When used, you will obtain one of eleven random items. They are:
--  Faerie Apple, Sunflower Seeds, Red Moko Grass, La Theine Cabbage, Boyahda Moss,
--  Pine Nuts, Beaugreens, Acorn, Dung, Batagreens, and Moko Grass
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return invaderXim.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    local giftList =
    {
        invaderXim.item.FAERIE_APPLE,
        invaderXim.item.HANDFUL_OF_SUNFLOWER_SEEDS,
        invaderXim.item.CLUMP_OF_RED_MOKO_GRASS,
        invaderXim.item.LA_THEINE_CABBAGE,
        invaderXim.item.CLUMP_OF_BOYAHDA_MOSS,
        invaderXim.item.HANDFUL_OF_PINE_NUTS,
        invaderXim.item.CLUMP_OF_BEAUGREENS,
        invaderXim.item.ACORN,
        invaderXim.item.CLUMP_OF_BATAGREENS,
        invaderXim.item.CLUMP_OF_MOKO_GRASS
    }

    local gift = math.random(1, #giftList)

    npcUtil.giveItem(target, { { giftList[gift], 1 } })
end

return itemObject
