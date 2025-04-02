-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Aveline
-- !pos -139 -6 46 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.FAERIE_APPLE,                45, 2,
        invaderXim.item.SARUTA_ORANGE,               33, 1,
        invaderXim.item.BUNCH_OF_SAN_DORIAN_GRAPES,  79, 3,
        invaderXim.item.SAN_DORIAN_CARROT,           33, 3,
        invaderXim.item.LA_THEINE_CABBAGE,           24, 2,
        invaderXim.item.FROST_TURNIP,                33, 1,
        invaderXim.item.FLASK_OF_OLIVE_OIL,          16, 3,
        invaderXim.item.SPRIG_OF_SAGE,              192, 3,
        invaderXim.item.HANDFUL_OF_BAY_LEAVES,      135, 1,
        invaderXim.item.BOTTLE_OF_APPLE_VINEGAR,     91, 1,
    }

    player:showText(npc, ID.text.RAIMBROYS_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
