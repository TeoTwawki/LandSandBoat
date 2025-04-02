-----------------------------------
-- Area: Bastok Markets
--  NPC: Sororo
-- !pos -220.217 -2.824 51.542 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.SCROLL_OF_CURE,         70, 3,
        invaderXim.item.SCROLL_OF_CURE_II,     676, 2,
        invaderXim.item.SCROLL_OF_CURAGA,     1575, 3,
        invaderXim.item.SCROLL_OF_POISONA,     208, 3,
        invaderXim.item.SCROLL_OF_PARALYNA,    374, 3,
        invaderXim.item.SCROLL_OF_BLINDNA,    1144, 3,
        invaderXim.item.SCROLL_OF_DIA,          95, 3,
        invaderXim.item.SCROLL_OF_BANISH,      162, 2,
        invaderXim.item.SCROLL_OF_DIAGA,      1346, 1,
        invaderXim.item.SCROLL_OF_BANISHGA,   1346, 2,
        invaderXim.item.SCROLL_OF_PROTECT,     253, 3,
        invaderXim.item.SCROLL_OF_SHELL,      1830, 3,
        invaderXim.item.SCROLL_OF_BLINK,      2423, 2,
        invaderXim.item.SCROLL_OF_STONESKIN,  8118, 1,
        invaderXim.item.SCROLL_OF_REPOSE,    34320, 3,
        invaderXim.item.SCROLL_OF_SLOW,        967, 1,
    }

    player:showText(npc, ID.text.SORORO_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
