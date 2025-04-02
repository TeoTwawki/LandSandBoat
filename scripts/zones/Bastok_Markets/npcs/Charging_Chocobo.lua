-----------------------------------
-- Area: Bastok Markets
--  NPC: Charging Chocobo
-- !pos -301.531 -10.319 -157.237 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_SUBLIGAR,    216, 3,
        invaderXim.item.SCALE_CUISSES,     1861, 3,
        invaderXim.item.BRASS_CUISSES,    16074, 2,
        invaderXim.item.CUISSES,          39312, 2,
        invaderXim.item.MYTHRIL_CUISSES,  66399, 1,
        invaderXim.item.BRONZE_LEGGINGS,    133, 3,
        invaderXim.item.SCALE_GREAVES,     1128, 3,
        invaderXim.item.BRASS_GREAVES,     9518, 2,
        invaderXim.item.PLATE_LEGGINGS,   24710, 2,
        invaderXim.item.MYTHRIL_LEGGINGS, 41527, 1,
        invaderXim.item.GORGET,           19094, 2,
        invaderXim.item.LEATHER_BELT,       442, 3,
        invaderXim.item.SILVER_BELT,      11880, 3,
        invaderXim.item.SWORDBELT,        22651, 1,
    }

    player:showText(npc, ID.text.CHARGINGCHOCOBO_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
