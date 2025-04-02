-----------------------------------
-- Area: Bastok_Mines
--  NPC: Mille
-- Norvallen Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.NORVALLEN) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.MILLE_CLOSED_DIALOG)
    else
        local stock =
        {
            invaderXim.item.ARROWWOOD_LOG,         20,
            invaderXim.item.POT_OF_CRYING_MUSTARD, 29,
            invaderXim.item.POD_OF_BLUE_PEAS,      29,
            invaderXim.item.ASH_LOG,               99,
        }

        player:showText(npc, ID.text.MILLE_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
