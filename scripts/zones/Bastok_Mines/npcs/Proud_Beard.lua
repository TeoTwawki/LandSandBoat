-----------------------------------
-- Area: Bastok Mines
--  NPC: Proud Beard
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        invaderXim.item.HUME_TUNIC,       312,
        invaderXim.item.HUME_VEST,        312,
        invaderXim.item.HUME_M_GLOVES,    187,
        invaderXim.item.HUME_F_GLOVES,    187,
        invaderXim.item.HUME_SLACKS,      270,
        invaderXim.item.HUME_PANTS,       270,
        invaderXim.item.HUME_M_BOOTS,     187,
        invaderXim.item.HUME_F_BOOTS,     187,
        invaderXim.item.GALKAN_SURCOAT,   312,
        invaderXim.item.GALKAN_BRACERS,   187,
        invaderXim.item.GALKAN_BRAGUETTE, 270,
        invaderXim.item.GALKAN_SANDALS,   187,
    }

    player:showText(npc, ID.text.PROUDBEARD_SHOP_DIALOG)
    invaderXim.shop.general(player, stock)
end

return entity
