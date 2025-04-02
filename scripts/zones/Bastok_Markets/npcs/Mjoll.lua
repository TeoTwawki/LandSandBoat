-----------------------------------
-- Area: Batok Markets
--  NPC: Mjoll
-- !pos -318.902 -10.319 -178.087 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.WOODEN_ARROW,                4, 2,
        invaderXim.item.IRON_ARROW,                  8, 3,
        invaderXim.item.SILVER_ARROW,               18, 1,
        invaderXim.item.SCROLL_OF_DARK_THRENODY,   225, 3,
        invaderXim.item.SCROLL_OF_ICE_THRENODY,   1131, 3,
        invaderXim.item.LIGHT_CROSSBOW,            187, 3,
        invaderXim.item.CROSSBOW,                 2449, 3,
        invaderXim.item.ZAMBURAK,                16005, 1,
        invaderXim.item.CROSSBOW_BOLT,               6, 3,
        invaderXim.item.MYTHRIL_BOLT,               24, 2,
        invaderXim.item.TATHLUM,                   334, 1,
    }

    player:showText(npc, ID.text.MJOLL_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
