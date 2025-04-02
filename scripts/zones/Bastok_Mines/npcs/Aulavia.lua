-----------------------------------
-- Area: Bastok Mines
--  NPC: Aulavia
-- Vollbow Regional Merchant
-----------------------------------
local ID = zones[invaderXim.zone.BASTOK_MINES]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    invaderXim.events.harvestFestival.onHalloweenTrade(player, trade, npc)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(invaderXim.region.VOLLBOW) ~= invaderXim.nation.BASTOK then
        player:showText(npc, ID.text.AULAVIA_CLOSED_DIALOG)
    else
        local stock =
        {
            636,   119,    -- Chamomile
            864,    88,    -- Fish Scales
            936,    14,    -- Rock Salt
            1410, 1656,     -- Sweet William
        }

        player:showText(npc, ID.text.AULAVIA_OPEN_DIALOG)
        invaderXim.shop.general(player, stock, invaderXim.fameArea.BASTOK)
    end
end

return entity
