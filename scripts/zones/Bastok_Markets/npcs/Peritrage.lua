-----------------------------------
-- Area: Bastok Markets
--  NPC: Peritrage
-- !pos -286.985 -10.319 -142.586 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_AXE,      328, 3,
        invaderXim.item.BRASS_AXE,      1622, 3,
        invaderXim.item.BATTLEAXE,     12757, 1,
        invaderXim.item.BUTTERFLY_AXE,   698, 3,
        invaderXim.item.GREATAXE,       4732, 3,
        invaderXim.item.BRONZE_KNIFE,    170, 3,
        invaderXim.item.KNIFE,          2522, 3,
        invaderXim.item.KUKRI,          6458, 1,
        invaderXim.item.BRONZE_DAGGER,   162, 3,
        invaderXim.item.BRASS_DAGGER,    967, 3,
        invaderXim.item.DAGGER,         2111, 3,
    }

    player:showText(npc, ID.text.PERITRAGE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
