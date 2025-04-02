-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Carautia
-- !pos 70 0 39 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.LAUAN_SHIELD,        124, 3,
        invaderXim.item.MAPLE_SHIELD,        629, 3,
        invaderXim.item.MAHOGANY_SHIELD,    5179, 2,
        invaderXim.item.KITE_SHIELD,       11880, 1,
        invaderXim.item.BRONZE_SUBLIGAR,     216, 3,
        invaderXim.item.BRASS_SUBLIGAR,     2080, 3,
        invaderXim.item.LEATHER_TROUSERS,    557, 3,
        invaderXim.item.STUDDED_TROUSERS,  19127, 2,
        invaderXim.item.CHAIN_HOSE,        13104, 1,
        invaderXim.item.BRONZE_LEGGINGS,     133, 3,
        invaderXim.item.BRASS_LEGGINGS,     1289, 3,
        invaderXim.item.LEATHER_HIGHBOOTS,   349, 3,
        invaderXim.item.STUDDED_BOOTS,     11618, 2,
        invaderXim.item.GREAVES,            8049, 1,
    }

    player:showText(npc, ID.text.CARAUTIA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
