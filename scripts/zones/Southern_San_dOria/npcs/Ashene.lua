-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- !pos 70 0 61 230
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_DAGGER,   162, 3,
        invaderXim.item.BRASS_DAGGER,    967, 3,
        invaderXim.item.DAGGER,         2111, 2,
        invaderXim.item.BASELARD,       4979, 1,
        invaderXim.item.XIPHOS,          698, 3,
        invaderXim.item.BRASS_XIPHOS,   4071, 3,
        invaderXim.item.GLADIUS,       19568, 1,
        invaderXim.item.BRONZE_SWORD,    278, 3,
        invaderXim.item.IRON_SWORD,     8236, 2,
        invaderXim.item.BROADSWORD,    24344, 1,
        invaderXim.item.SPATHA,         1934, 3,
        invaderXim.item.LONGSWORD,      9584, 2,
        invaderXim.item.HUNTING_SWORD, 41333, 1,
        invaderXim.item.BILBO,          3634, 3,
        invaderXim.item.FLEURET,       15491, 1,
    }

    player:showText(npc, ID.text.ASH_THADI_ENE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.SANDORIA)
end

return entity
