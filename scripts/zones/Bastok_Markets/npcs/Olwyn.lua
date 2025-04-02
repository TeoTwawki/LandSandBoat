-----------------------------------
-- Area: Bastok Markets
--  NPC: Olwyn
-- !pos -322.123 -10.319 -169.418 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.FLASK_OF_EYE_DROPS,  2698, 3,
        invaderXim.item.ANTIDOTE,             328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,  832, 2,
        invaderXim.item.POTION,               946, 2,
        invaderXim.item.ETHER,               5025, 1,
    }

    player:showText(npc, ID.text.OLWYN_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
