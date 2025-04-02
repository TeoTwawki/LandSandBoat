-----------------------------------
-- Area: Bastok Markets
--  NPC: Carmelide
-- !pos -151.693 -4.819 -69.635 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.TOURMALINE,   1937, 2,
        invaderXim.item.SARDONYX,     1937, 2,
        invaderXim.item.AMETHYST,     1937, 2,
        invaderXim.item.AMBER_STONE,  1937, 2,
        invaderXim.item.LAPIS_LAZULI, 1937, 2,
        invaderXim.item.CLEAR_TOPAZ,  1937, 2,
        invaderXim.item.ONYX,         1937, 2,
        invaderXim.item.LIGHT_OPAL,   1937, 2,
        invaderXim.item.COPPER_RING,    79, 3,
    }

    player:showText(npc, ID.text.CARMELIDE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
