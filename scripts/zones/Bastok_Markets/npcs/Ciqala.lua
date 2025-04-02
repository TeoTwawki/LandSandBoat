-----------------------------------
-- Area: Bastok Markets
--  NPC: Ciqala
-- Type: Merchant
-- !pos -283.147 -11.319 -143.680 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.BRONZE_KNUCKLES,  253, 3,
        invaderXim.item.BRASS_KNUCKLES,   936, 3,
        invaderXim.item.METAL_KNUCKLES,  5447, 1,
        invaderXim.item.CESTI,            149, 3,
        invaderXim.item.BRASS_BAGHNAKHS, 1757, 3,
        invaderXim.item.CAT_BAGHNAKHS,    120, 3,
        invaderXim.item.BRONZE_HAMMER,    353, 3,
        invaderXim.item.BRASS_HAMMER,    2407, 3,
        invaderXim.item.WARHAMMER,       6820, 1,
        invaderXim.item.MAPLE_WAND,        54, 3,
        invaderXim.item.ASH_CLUB,          74, 3,
        invaderXim.item.BRONZE_ROD,       104, 3,
        invaderXim.item.BRASS_ROD,        717, 3,
        invaderXim.item.ASH_STAFF,         66, 3,
        invaderXim.item.ASH_POLE,         436, 3,
    }

    player:showText(npc, ID.text.CIQALA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
