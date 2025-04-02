-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Capucine
-----------------------------------
local ID = zones[invaderXim.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.POETS_CIRCLET, 2152,
        invaderXim.item.TUNIC,         1456,
        invaderXim.item.LINEN_ROBE,    3208,
        invaderXim.item.MITTS,          681,
        invaderXim.item.LINEN_CUFFS,   1814,
        invaderXim.item.SLACKS,         972,
        invaderXim.item.LINEN_SLOPS,   2620,
        invaderXim.item.SOLEA,          629,
        invaderXim.item.HOLLY_CLOGS,   1690,
    }

    player:showText(npc, ID.text.CAPUCINE_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
