-----------------------------------
-- Area: Bastok_Mines
--  NPC: Faustin
-- Ronfaure Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.RONFAURE) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.FAUSTIN_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.SAN_DORIAN_CARROT,           33,
            invaderXim.item.BUNCH_OF_SAN_DORIAN_GRAPES,  79,
            invaderXim.item.RONFAURE_CHESTNUT,          124,
            invaderXim.item.BAG_OF_SAN_DORIAN_FLOUR,     62,
        }

        player:showText(npc, ID.text.FAUSTIN_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
