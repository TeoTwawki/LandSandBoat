-----------------------------------
-- Area: Port San d'Oria
--  NPC: Albinie
-----------------------------------
local ID = zones[invaderXim.zone.PORT_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.ASH_LOG,                   99, 3,
        invaderXim.item.CHESTNUT_LOG,            2939, 2,
        invaderXim.item.OAK_LOG,                 6572, 1,
        invaderXim.item.CHUNK_OF_COPPER_ORE,       12, 2,
        invaderXim.item.CHUNK_OF_IRON_ORE,        936, 2,
        invaderXim.item.CHUNK_OF_MYTHRIL_ORE,    2080, 1,
        invaderXim.item.CLUMP_OF_MOKO_GRASS,       20, 2,
        invaderXim.item.BIRD_EGG,                  58, 2,
        invaderXim.item.FLAX_FLOWER,              260, 1,
        invaderXim.item.PILE_OF_CHOCOBO_BEDDING, 2080, 3,
    }

    player:showText(npc, ID.text.ALBINIE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
