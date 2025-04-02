-----------------------------------
-- Area: Port Bastok
--  NPC: Valeriano
-----------------------------------
local ID = zones[invaderXim.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.GINGER_COOKIE,                  12,
        invaderXim.item.FLUTE,                          49,
        invaderXim.item.PICCOLO,                      1144,
        invaderXim.item.SCROLL_OF_SCOPS_OPERETTA,      677,
        invaderXim.item.SCROLL_OF_PUPPETS_OPERETTA,  19552,
        invaderXim.item.SCROLL_OF_FOWL_AUBADE,        3369,
        invaderXim.item.SCROLL_OF_ADVANCING_MARCH,    2379,
        invaderXim.item.SCROLL_OF_GODDESSS_HYMNUS,  104000,
        invaderXim.item.SCROLL_OF_FIRE_CAROL_II,     37128,
        invaderXim.item.SCROLL_OF_WIND_CAROL_II,     34944,
        invaderXim.item.SCROLL_OF_EARTH_CAROL_II,    30680,
        invaderXim.item.SCROLL_OF_WATER_CAROL_II,    32240,
        invaderXim.item.SCROLL_OF_MAGES_BALLAD_III, 140039,
    }

    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
