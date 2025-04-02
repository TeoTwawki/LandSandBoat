-----------------------------------
-- Area: Batok Markets
--  NPC: Zaira
-- !pos -217.316 -2.824 49.235 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.SCROLL_OF_STONE,      70, 3,
        invaderXim.item.SCROLL_OF_WATER,     162, 3,
        invaderXim.item.SCROLL_OF_AERO,      374, 3,
        invaderXim.item.SCROLL_OF_FIRE,      967, 3,
        invaderXim.item.SCROLL_OF_BLIZZARD, 1830, 3,
        invaderXim.item.SCROLL_OF_THUNDER,  3768, 3,
        invaderXim.item.SCROLL_OF_POISON,     95, 2,
        invaderXim.item.SCROLL_OF_BIO,       416, 2,
        invaderXim.item.SCROLL_OF_BLIND,     128, 1,
        invaderXim.item.SCROLL_OF_SLEEP,    2600, 2,
        invaderXim.item.SCROLL_OF_BURN,     5366, 3,
        invaderXim.item.SCROLL_OF_FROST,    4261, 3,
        invaderXim.item.SCROLL_OF_CHOCKE,   2600, 3,
        invaderXim.item.SCROLL_OF_RASP,     2111, 3,
        invaderXim.item.SCROLL_OF_SHOCK,    1575, 3,
        invaderXim.item.SCROLL_OF_DROWN,    7356, 3,
    }

    player:showText(npc, ID.text.ZAIRA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
