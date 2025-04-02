-----------------------------------
-- Area: Bastok Markets
--  NPC: Raghd
-- !pos -149.200 -4.819 -74.939 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.COPPER_RING,      79, 3,
        invaderXim.item.BRASS_RING,      208, 2,
        invaderXim.item.SILVER_RING,    1300, 1,
        invaderXim.item.SILVER_EARRING, 1300, 1,
    }

    player:showText(npc, ID.text.RAGHD_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
