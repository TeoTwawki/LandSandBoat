-----------------------------------
-- Area: Bastok Markets
--  NPC: Balthilda
-- Type: Merchant
-- !pos -300 -10 -161 235
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MARKETS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.POETS_CIRCLET, 2152, 3,
        invaderXim.item.TUNIC,         1456, 3,
        invaderXim.item.LINEN_ROBE,    3208, 3,
        invaderXim.item.MITTS,          681, 3,
        invaderXim.item.LINEN_CUFFS,   1814, 3,
        invaderXim.item.SLACKS,         972, 3,
        invaderXim.item.LINEN_SLOPS,   2620, 3,
        invaderXim.item.SOLEA,          629, 3,
        invaderXim.item.HOLLY_CLOGS,   1690, 3,
        invaderXim.item.LEATHER_RING,  1300, 3,
    }

    player:showText(npc, ID.text.BALTHILDA_SHOP_DIALOG)
    invaderXim.shop.nation(player, stock, invaderXim.nation.BASTOK)
end

return entity
