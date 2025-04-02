-----------------------------------
-- Area: Bastok Mines
--  NPC: Deegis
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_CAP,        174, 3,
        invaderXim.item.BRASS_CAP,        1700, 2,
        invaderXim.item.PADDED_CAP,      21216, 1,
        invaderXim.item.LEATHER_BANDANA,   457, 2,
        invaderXim.item.IRON_MASK,       10670, 1,
        invaderXim.item.BRONZE_HARNESS,    266, 3,
        invaderXim.item.BRASS_HARNESS,    2584, 2,
        invaderXim.item.PADDED_ARMOR,    32747, 1,
        invaderXim.item.LEATHER_VEST,      698, 2,
        invaderXim.item.CHAINMAIL,       16473, 3,
        invaderXim.item.BRONZE_MITTENS,    145, 3,
        invaderXim.item.BRASS_MITTENS,    1419, 2,
        invaderXim.item.IRON_MITTENS,    17971, 1,
        invaderXim.item.LEATHER_GLOVES,    374, 2,
        invaderXim.item.CHAIN_MITTENS,    8798, 3,
    }

    player:showText(npc, ID.text.DEEGIS_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
