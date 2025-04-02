-----------------------------------
-- Area: Port Bastok
--  NPC: Denvihr
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.ASH_LOG,                     99, 2,
        invaderXim.item.CHESTNUT_LOG,              2939, 2,
        invaderXim.item.OAK_LOG,                   6572, 1,
        invaderXim.item.CHUNK_OF_COPPER_ORE,         12, 3,
        invaderXim.item.CHUNK_OF_IRON_ORE,          936, 2,
        invaderXim.item.CHUNK_OF_MYTHRIL_ORE,      2080, 1,
        invaderXim.item.CLUMP_OF_MOKO_GRASS,         20, 2,
        invaderXim.item.BIRD_EGG,                    58, 2,
        invaderXim.item.FLAX_FLOWER,                260, 1,
        invaderXim.item.SET_OF_KAISERIN_COSMETICS, 2080, 3,
    }

    player:showText(npc, ID.text.DENVIHR_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
