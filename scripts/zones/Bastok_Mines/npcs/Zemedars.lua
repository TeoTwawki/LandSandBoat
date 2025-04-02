-----------------------------------
-- Area: Bastok Mines
--  NPC: Zemedars
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_SUBLIGAR,     216, 3,
        invaderXim.item.BRASS_SUBLIGAR,     2080, 2,
        invaderXim.item.IRON_SUBLIGAR,     26357, 1,
        invaderXim.item.LEATHER_TROUSERS,    557, 2,
        invaderXim.item.LIZARD_TROUSERS,    5656, 1,
        invaderXim.item.CHAIN_HOSE,        13104, 3,
        invaderXim.item.BRONZE_LEGGINGS,     133, 3,
        invaderXim.item.BRASS_LEGGINGS,     1289, 2,
        invaderXim.item.LEGGINGS,          16373, 1,
        invaderXim.item.LEATHER_HIGHBOOTS,   349, 2,
        invaderXim.item.LIZARD_LEDELSENS,   3575, 1,
        invaderXim.item.GREAVES,            8049, 3,
        invaderXim.item.MAPLE_SHIELD,        629, 3,
        invaderXim.item.LAUAN_SHIELD,        124, 3,
        invaderXim.item.TARGE,             12521, 2,
        invaderXim.item.BUCKLER,           35658, 1,
    }

    player:showText(npc, ID.text.ZEMEDARS_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
