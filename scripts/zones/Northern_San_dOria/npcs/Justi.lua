-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Justi
-- Conquest depending furniture seller
-----------------------------------
local ID = zones[invaderXim.zone.NORTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.SPOOL_OF_BUNDLING_TWINE,     92, 3,
        invaderXim.item.WATER_CASK,                 518, 3,
        invaderXim.item.CUPBOARD,                 15881, 3,
        invaderXim.item.OAK_TABLE,               129168, 3,
        invaderXim.item.DRESSER,                 170726, 1,
        invaderXim.item.ARMOR_BOX,                 8376, 3,
        invaderXim.item.COFFER,                   35272, 2,
        invaderXim.item.CABINET,                  69888, 1,
        invaderXim.item.CHIFFONIER,               57333, 1,
    }

    player:showText(npc, ID.text.JUSTI_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
