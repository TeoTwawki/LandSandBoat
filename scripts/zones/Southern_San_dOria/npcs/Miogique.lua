-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Miogique
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_CAP,        174, 3,
        invaderXim.item.BRASS_CAP,        1700, 3,
        invaderXim.item.LEATHER_BANDANA,   457, 3,
        invaderXim.item.STUDDED_BANDANA, 14899, 2,
        invaderXim.item.IRON_MASK,       10670, 1,
        invaderXim.item.BRONZE_HARNESS,    266, 3,
        invaderXim.item.BRASS_HARNESS,    2584, 3,
        invaderXim.item.LEATHER_VEST,      698, 3,
        invaderXim.item.STUDDED_VEST,    23712, 2,
        invaderXim.item.CHAINMAIL,       16473, 1,
        invaderXim.item.BRONZE_MITTENS,    145, 3,
        invaderXim.item.BRASS_MITTENS,    1419, 3,
        invaderXim.item.LEATHER_GLOVES,    374, 3,
        invaderXim.item.STUDDED_GLOVES,  12448, 2,
        invaderXim.item.CHAIN_MITTENS,    8798, 1,
        invaderXim.item.GAUNTLETS,       26956, 1,
    }

    player:showText(npc, ID.text.RAIMBROYS_SHOP_DIALOG + 1)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
