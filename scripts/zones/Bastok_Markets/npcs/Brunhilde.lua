-----------------------------------
-- Area: Bastok Markets
--  NPC: Brunhilde
-- !pos -305.775 -10.319 -152.173 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_CAP,               174, 3,
        invaderXim.item.FACEGUARD,               1508, 3,
        invaderXim.item.BRASS_MASK,             13312, 2,
        invaderXim.item.SALLET,                 33134, 2,
        invaderXim.item.MYTHRIL_SALLET,         59109, 1,
        invaderXim.item.BRONZE_HARNESS,           266, 3,
        invaderXim.item.SCALE_MAIL,              2319, 3,
        invaderXim.item.BRASS_SCALE_MAIL,       20267, 2,
        invaderXim.item.BREASTPLATE,            51105, 1,
        invaderXim.item.BRONZE_MITTENS,           145, 3,
        invaderXim.item.SCALE_FINGER_GAUNTLETS,  1237, 3,
        invaderXim.item.BRASS_FINGER_GAUNTLETS, 10782, 2,
        invaderXim.item.GAUNTLETS,              26956, 1,
    }

    player:showText(npc, ID.text.BRUNHILDE_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
