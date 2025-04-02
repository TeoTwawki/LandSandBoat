-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Boncort
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
require('scripts/quests/flyers_for_regine')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    quests.ffr.onTrade(player, npc, trade, 7) -- FLYERS FOR REGINE
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LOAF_OF_BLACK_BREAD,      124, 3,
        invaderXim.item.LOAF_OF_WHITE_BREAD,      208, 2,
        invaderXim.item.STRIP_OF_MEAT_JERKY,      124, 3,
        invaderXim.item.SMOKED_SALMON,            228, 2,
        invaderXim.item.FLASK_OF_DISTILLED_WATER,  12, 3,
        invaderXim.item.BOTTLE_OF_GRAPE_JUICE,    967, 1,
        invaderXim.item.BOTTLE_OF_APPLE_JUICE,    312, 2,
        invaderXim.item.SCROLL_OF_SWORD_MADRIGAL, 189, 3,
    }

    player:showText(npc, ID.text.BONCORT_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
