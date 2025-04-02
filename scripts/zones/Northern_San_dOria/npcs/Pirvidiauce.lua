-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pirvidiauce
-- Conquest depending medicine seller
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.CERAMIC_FLOWERPOT,    1040, 3,
        invaderXim.item.PILE_OF_RED_GRAVEL,   2293, 3,
        invaderXim.item.ASH_CLOGS,             128, 3,
        invaderXim.item.HOLLY_CLOGS,          1690, 2,
        invaderXim.item.CHESTNUT_SABOTS,      9547, 1,
        invaderXim.item.WOODEN_ARROW,            4, 3,
        invaderXim.item.CROSSBOW_BOLT,           6, 2,
        invaderXim.item.FLASK_OF_EYE_DROPS,   2698, 3,
        invaderXim.item.ANTIDOTE,              328, 3,
        invaderXim.item.FLASK_OF_ECHO_DROPS,   832, 2,
        invaderXim.item.POTION,                946, 1,
        invaderXim.item.ETHER,                5025, 1,
        invaderXim.item.KINGDOM_WAYSTONE,    10400, 3,
    }

    player:showText(npc, ID.text.PIRVIDIAUCE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
