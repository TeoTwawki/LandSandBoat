-----------------------------------
-- Area: Bastok Markets
--  NPC: Harmodios
-- !pos -79.928 -4.824 -135.114 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.GEMSHORN,                      5366, 3,
        invaderXim.item.CORNETTE,                       253, 2,
        invaderXim.item.FLUTE,                           49, 3,
        invaderXim.item.PICCOLO,                       1144, 1,
        invaderXim.item.MAPLE_HARP,                      49, 2,
        invaderXim.item.SCROLL_OF_VITAL_ETUDE,        79872, 2,
        invaderXim.item.SCROLL_OF_SWIFT_ETUDE,        76544, 2,
        invaderXim.item.SCROLL_OF_SAGE_ETUDE,         73216, 2,
        invaderXim.item.SCROLL_OF_LOGICAL_ETUDE,      65520, 2,
        invaderXim.item.SCROLL_OF_BEWITCHING_ETUDE,   62400, 3,
        invaderXim.item.SCROLL_OF_HERCULEAN_ETUDE,    91936, 2,
        invaderXim.item.SCROLL_OF_UNCANNY_ETUDE,      88400, 2,
        invaderXim.item.SCROLL_OF_FOE_SIRVENTE,      103350, 3,
        invaderXim.item.SCROLL_OF_ADVENTURERS_DIRGE, 103350, 3,
    }

    player:showText(npc, ID.text.HARMODIOS_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
